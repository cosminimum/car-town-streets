package com.miniclip.nativeJNI;

import android.app.ActivityManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import com.tapjoy.TapjoyConstants;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Locale;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class infoTransmitter {
    static final HostnameVerifier DO_NOT_VERIFY = new HostnameVerifier() {
        public boolean verify(String hostname, SSLSession session) {
            return true;
        }
    };
    private Context mContext;
    private String mDeviceID;
    /* access modifiers changed from: private */
    public JSONObject mSendJSON;

    public infoTransmitter(Context context, String deviceID) {
        this.mContext = context;
        this.mDeviceID = deviceID;
        if (((ConnectivityManager) this.mContext.getSystemService("connectivity")).getActiveNetworkInfo() != null) {
            SharedPreferences settings = this.mContext.getSharedPreferences("INFO_TRANSMITTER", 0);
            if (settings.getBoolean("FIRST_RUN", true)) {
                SharedPreferences.Editor editor = settings.edit();
                editor.putBoolean("FIRST_RUN", false);
                editor.commit();
                try {
                    generateJSON();
                    send();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void generateJSON() {
        this.mSendJSON = new JSONObject();
        String app_version_name = "";
        String app_version_code = "";
        try {
            PackageInfo pi = this.mContext.getPackageManager().getPackageInfo(this.mContext.getPackageName(), 0);
            if (pi != null) {
                app_version_name = pi.versionName;
                app_version_code = String.valueOf(pi.versionCode);
            }
        } catch (PackageManager.NameNotFoundException e) {
        }
        try {
            ActivityManager.MemoryInfo mi = new ActivityManager.MemoryInfo();
            ((ActivityManager) this.mContext.getSystemService("activity")).getMemoryInfo(mi);
            long ram_free_mb = mi.availMem / 1048576;
            long ram_total_mb = 0;
            try {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream("/proc/meminfo")), 1000);
                StringBuffer lines = new StringBuffer();
                while (true) {
                    String line = bufferedReader.readLine();
                    if (line == null) {
                        break;
                    }
                    if (line.length() > 9 && line.substring(0, 8).compareTo("MemTotal") == 0) {
                        String[] lineb = line.split("\\s*:\\s*");
                        if (lineb.length > 1) {
                            ram_total_mb = ((long) Integer.parseInt(lineb[1].replaceAll("[\\sa-zA-Z]*", ""))) / 1024;
                        }
                    }
                    lines.append(line + "\n");
                }
                bufferedReader.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
            int width = this.mContext.getResources().getDisplayMetrics().widthPixels;
            int height = this.mContext.getResources().getDisplayMetrics().heightPixels;
            float density = this.mContext.getResources().getDisplayMetrics().density;
            float xdpi = this.mContext.getResources().getDisplayMetrics().xdpi;
            float ydpi = this.mContext.getResources().getDisplayMetrics().xdpi;
            String cpu_name = "";
            int cpu_cores = 0;
            try {
                BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(new FileInputStream("/proc/cpuinfo")), 1000);
                StringBuffer lines2 = new StringBuffer();
                while (true) {
                    String line2 = bufferedReader2.readLine();
                    if (line2 == null) {
                        break;
                    }
                    if (line2.length() > 9) {
                        String linea = line2.substring(0, 9);
                        if (linea.compareTo("processor") == 0) {
                            cpu_cores++;
                        }
                        if (linea.compareTo("Processor") == 0) {
                            String[] lineb2 = line2.split("\\s*:\\s*");
                            if (lineb2.length > 1) {
                                cpu_name = lineb2[1];
                            }
                        }
                    }
                    lines2.append(line2 + "\n");
                }
                bufferedReader2.close();
            } catch (IOException ex2) {
                ex2.printStackTrace();
            }
            if (cpu_cores == 0) {
                cpu_cores = 1;
            }
            int cpu_mhz = 0;
            try {
                BufferedReader bufferedReader3 = new BufferedReader(new InputStreamReader(new FileInputStream("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq")), 1000);
                String line3 = bufferedReader3.readLine();
                bufferedReader3.close();
                cpu_mhz = Integer.parseInt(line3) / 1000;
            } catch (IOException ex3) {
                ex3.printStackTrace();
            }
            StatFs statFs = new StatFs(this.mContext.getFilesDir().getAbsolutePath());
            long blockSize = (long) statFs.getBlockSize();
            long internal_total_mb = (((long) statFs.getBlockCount()) * blockSize) / 1048576;
            long internal_free_mb = (((long) statFs.getAvailableBlocks()) * blockSize) / 1048576;
            StatFs statFs2 = new StatFs(Environment.getExternalStorageDirectory().getAbsolutePath());
            long blockSizeExt = (long) statFs2.getBlockSize();
            long external_total_mb = (((long) statFs2.getBlockCount()) * blockSizeExt) / 1048576;
            long external_free_mb = (((long) statFs2.getAvailableBlocks()) * blockSizeExt) / 1048576;
            NetworkInfo ni = ((ConnectivityManager) this.mContext.getSystemService("connectivity")).getActiveNetworkInfo();
            int isOnline = 0;
            String connectionType = "";
            if (ni != null) {
                isOnline = 1;
                connectionType = ni.getTypeName();
            }
            TelephonyManager tm = (TelephonyManager) this.mContext.getSystemService("phone");
            String country_code = "";
            if (tm != null) {
                country_code = tm.getNetworkCountryIso();
            }
            if (country_code.compareTo("") == 0) {
                country_code = Locale.getDefault().getCountry();
            }
            this.mSendJSON.put("did", this.mDeviceID);
            this.mSendJSON.put("app_version_name", app_version_name);
            this.mSendJSON.put("app_version_code", app_version_code);
            this.mSendJSON.put(TapjoyConstants.TJC_APP_ID_NAME, this.mContext.getPackageName());
            this.mSendJSON.put("android_version", Build.VERSION.RELEASE);
            this.mSendJSON.put("android_build_name", Build.DISPLAY);
            this.mSendJSON.put(TapjoyConstants.TJC_DEVICE_NAME, Build.MODEL);
            this.mSendJSON.put("ram_total_mb", String.valueOf(ram_total_mb));
            this.mSendJSON.put("ram_free_mb", String.valueOf(ram_free_mb));
            this.mSendJSON.put("screen_width", String.valueOf(width));
            this.mSendJSON.put("screen_height", String.valueOf(height));
            this.mSendJSON.put(TapjoyConstants.TJC_DEVICE_SCREEN_DENSITY, String.valueOf(density));
            this.mSendJSON.put("screen_dpi_x", String.valueOf(xdpi));
            this.mSendJSON.put("screen_dpi_y", String.valueOf(ydpi));
            this.mSendJSON.put("cpu_mhz", String.valueOf(cpu_mhz));
            this.mSendJSON.put("cpu_name", cpu_name);
            this.mSendJSON.put("cpu_cores", String.valueOf(cpu_cores));
            this.mSendJSON.put("internal_total_mb", String.valueOf(internal_total_mb));
            this.mSendJSON.put("internal_free_mb", String.valueOf(internal_free_mb));
            this.mSendJSON.put("external_total_mb", String.valueOf(external_total_mb));
            this.mSendJSON.put("external_free_mb", String.valueOf(external_free_mb));
            this.mSendJSON.put("internet_enabled", String.valueOf(isOnline));
            this.mSendJSON.put(TapjoyConstants.TJC_CONNECTION_TYPE, connectionType);
            this.mSendJSON.put(TapjoyConstants.TJC_DEVICE_COUNTRY_CODE, country_code);
            JSONArray apps_installed = new JSONArray();
            for (PackageInfo cpi : this.mContext.getPackageManager().getInstalledPackages(0)) {
                if (!(cpi.packageName.compareTo("android") == 0 || cpi.packageName.length() <= 14 || cpi.packageName.substring(0, 12).compareTo("com.android.") == 0 || cpi.packageName.substring(0, 11).compareTo("com.google.") == 0)) {
                    JSONObject app = new JSONObject();
                    app.put("package_name", cpi.packageName);
                    apps_installed.put(app);
                }
            }
        } catch (JSONException e2) {
        }
    }

    public void send() {
        new Thread() {
            public void run() {
                String data = infoTransmitter.this.mSendJSON.toString();
                try {
                    URL url = new URL("https://ftp.miniclippt.com/submit_stats.php");
                    infoTransmitter.trustAllHosts();
                    HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
                    conn.setHostnameVerifier(infoTransmitter.DO_NOT_VERIFY);
                    conn.setConnectTimeout(2000);
                    conn.setDoOutput(true);
                    OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
                    wr.write(data);
                    wr.flush();
                    BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    StringBuffer lines = new StringBuffer();
                    while (true) {
                        String line = rd.readLine();
                        if (line != null) {
                            lines.append(line);
                        } else {
                            wr.close();
                            rd.close();
                            return;
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }.start();
    }

    /* access modifiers changed from: private */
    public static void trustAllHosts() {
        TrustManager[] trustAllCerts = {new X509TrustManager() {
            public X509Certificate[] getAcceptedIssuers() {
                return new X509Certificate[0];
            }

            public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            }

            public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            }
        }};
        try {
            SSLContext sc = SSLContext.getInstance("TLS");
            sc.init((KeyManager[]) null, trustAllCerts, new SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
