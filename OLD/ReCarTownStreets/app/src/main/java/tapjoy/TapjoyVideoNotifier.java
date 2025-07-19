package tapjoy;

public interface TapjoyVideoNotifier {
    void videoComplete();

    void videoError(int i);

    void videoReady();
}
