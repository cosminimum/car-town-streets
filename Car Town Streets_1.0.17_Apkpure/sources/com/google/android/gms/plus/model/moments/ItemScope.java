package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.internal.ib;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
public interface ItemScope extends Freezable<ItemScope> {

    /* loaded from: classes.dex */
    public static class Builder {
        private String AI;
        private ib EA;
        private List<ib> EB;
        private String EC;
        private String ED;
        private ib EE;
        private String EF;
        private String EG;
        private String EH;
        private List<ib> EI;
        private String EJ;
        private String EK;
        private String EL;
        private String EM;
        private String EN;
        private String EO;
        private String EP;
        private String EQ;
        private ib ER;
        private String ES;
        private String ET;
        private String EU;
        private ib EV;
        private ib EW;
        private ib EX;
        private List<ib> EY;
        private String EZ;
        private final Set<Integer> Eq = new HashSet();
        private ib Er;
        private List<String> Es;
        private ib Et;
        private String Eu;
        private String Ev;
        private String Ew;
        private List<ib> Ex;
        private int Ey;
        private List<ib> Ez;
        private String Fa;
        private String Fb;
        private String Fc;
        private ib Fd;
        private String Fe;
        private String Ff;
        private String Fg;
        private ib Fh;
        private String Fi;
        private String Fj;
        private String Fk;
        private String Fl;
        private String iH;
        private String mName;
        private String sJ;
        private String uS;
        private double xw;
        private double xx;

        public ItemScope build() {
            return new ib(this.Eq, this.Er, this.Es, this.Et, this.Eu, this.Ev, this.Ew, this.Ex, this.Ey, this.Ez, this.EA, this.EB, this.EC, this.ED, this.EE, this.EF, this.EG, this.EH, this.EI, this.EJ, this.EK, this.EL, this.sJ, this.EM, this.EN, this.EO, this.EP, this.EQ, this.ER, this.ES, this.ET, this.uS, this.EU, this.EV, this.xw, this.EW, this.xx, this.mName, this.EX, this.EY, this.EZ, this.Fa, this.Fb, this.Fc, this.Fd, this.Fe, this.Ff, this.Fg, this.Fh, this.Fi, this.Fj, this.AI, this.iH, this.Fk, this.Fl);
        }

        public Builder setAbout(ItemScope about) {
            this.Er = (ib) about;
            this.Eq.add(2);
            return this;
        }

        public Builder setAdditionalName(List<String> additionalName) {
            this.Es = additionalName;
            this.Eq.add(3);
            return this;
        }

        public Builder setAddress(ItemScope address) {
            this.Et = (ib) address;
            this.Eq.add(4);
            return this;
        }

        public Builder setAddressCountry(String addressCountry) {
            this.Eu = addressCountry;
            this.Eq.add(5);
            return this;
        }

        public Builder setAddressLocality(String addressLocality) {
            this.Ev = addressLocality;
            this.Eq.add(6);
            return this;
        }

        public Builder setAddressRegion(String addressRegion) {
            this.Ew = addressRegion;
            this.Eq.add(7);
            return this;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public Builder setAssociated_media(List<ItemScope> associated_media) {
            this.Ex = associated_media;
            this.Eq.add(8);
            return this;
        }

        public Builder setAttendeeCount(int attendeeCount) {
            this.Ey = attendeeCount;
            this.Eq.add(9);
            return this;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public Builder setAttendees(List<ItemScope> attendees) {
            this.Ez = attendees;
            this.Eq.add(10);
            return this;
        }

        public Builder setAudio(ItemScope audio) {
            this.EA = (ib) audio;
            this.Eq.add(11);
            return this;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public Builder setAuthor(List<ItemScope> author) {
            this.EB = author;
            this.Eq.add(12);
            return this;
        }

        public Builder setBestRating(String bestRating) {
            this.EC = bestRating;
            this.Eq.add(13);
            return this;
        }

        public Builder setBirthDate(String birthDate) {
            this.ED = birthDate;
            this.Eq.add(14);
            return this;
        }

        public Builder setByArtist(ItemScope byArtist) {
            this.EE = (ib) byArtist;
            this.Eq.add(15);
            return this;
        }

        public Builder setCaption(String caption) {
            this.EF = caption;
            this.Eq.add(16);
            return this;
        }

        public Builder setContentSize(String contentSize) {
            this.EG = contentSize;
            this.Eq.add(17);
            return this;
        }

        public Builder setContentUrl(String contentUrl) {
            this.EH = contentUrl;
            this.Eq.add(18);
            return this;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public Builder setContributor(List<ItemScope> contributor) {
            this.EI = contributor;
            this.Eq.add(19);
            return this;
        }

        public Builder setDateCreated(String dateCreated) {
            this.EJ = dateCreated;
            this.Eq.add(20);
            return this;
        }

        public Builder setDateModified(String dateModified) {
            this.EK = dateModified;
            this.Eq.add(21);
            return this;
        }

        public Builder setDatePublished(String datePublished) {
            this.EL = datePublished;
            this.Eq.add(22);
            return this;
        }

        public Builder setDescription(String description) {
            this.sJ = description;
            this.Eq.add(23);
            return this;
        }

        public Builder setDuration(String duration) {
            this.EM = duration;
            this.Eq.add(24);
            return this;
        }

        public Builder setEmbedUrl(String embedUrl) {
            this.EN = embedUrl;
            this.Eq.add(25);
            return this;
        }

        public Builder setEndDate(String endDate) {
            this.EO = endDate;
            this.Eq.add(26);
            return this;
        }

        public Builder setFamilyName(String familyName) {
            this.EP = familyName;
            this.Eq.add(27);
            return this;
        }

        public Builder setGender(String gender) {
            this.EQ = gender;
            this.Eq.add(28);
            return this;
        }

        public Builder setGeo(ItemScope geo) {
            this.ER = (ib) geo;
            this.Eq.add(29);
            return this;
        }

        public Builder setGivenName(String givenName) {
            this.ES = givenName;
            this.Eq.add(30);
            return this;
        }

        public Builder setHeight(String height) {
            this.ET = height;
            this.Eq.add(31);
            return this;
        }

        public Builder setId(String id) {
            this.uS = id;
            this.Eq.add(32);
            return this;
        }

        public Builder setImage(String image) {
            this.EU = image;
            this.Eq.add(33);
            return this;
        }

        public Builder setInAlbum(ItemScope inAlbum) {
            this.EV = (ib) inAlbum;
            this.Eq.add(34);
            return this;
        }

        public Builder setLatitude(double latitude) {
            this.xw = latitude;
            this.Eq.add(36);
            return this;
        }

        public Builder setLocation(ItemScope location) {
            this.EW = (ib) location;
            this.Eq.add(37);
            return this;
        }

        public Builder setLongitude(double longitude) {
            this.xx = longitude;
            this.Eq.add(38);
            return this;
        }

        public Builder setName(String name) {
            this.mName = name;
            this.Eq.add(39);
            return this;
        }

        public Builder setPartOfTVSeries(ItemScope partOfTVSeries) {
            this.EX = (ib) partOfTVSeries;
            this.Eq.add(40);
            return this;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public Builder setPerformers(List<ItemScope> performers) {
            this.EY = performers;
            this.Eq.add(41);
            return this;
        }

        public Builder setPlayerType(String playerType) {
            this.EZ = playerType;
            this.Eq.add(42);
            return this;
        }

        public Builder setPostOfficeBoxNumber(String postOfficeBoxNumber) {
            this.Fa = postOfficeBoxNumber;
            this.Eq.add(43);
            return this;
        }

        public Builder setPostalCode(String postalCode) {
            this.Fb = postalCode;
            this.Eq.add(44);
            return this;
        }

        public Builder setRatingValue(String ratingValue) {
            this.Fc = ratingValue;
            this.Eq.add(45);
            return this;
        }

        public Builder setReviewRating(ItemScope reviewRating) {
            this.Fd = (ib) reviewRating;
            this.Eq.add(46);
            return this;
        }

        public Builder setStartDate(String startDate) {
            this.Fe = startDate;
            this.Eq.add(47);
            return this;
        }

        public Builder setStreetAddress(String streetAddress) {
            this.Ff = streetAddress;
            this.Eq.add(48);
            return this;
        }

        public Builder setText(String text) {
            this.Fg = text;
            this.Eq.add(49);
            return this;
        }

        public Builder setThumbnail(ItemScope thumbnail) {
            this.Fh = (ib) thumbnail;
            this.Eq.add(50);
            return this;
        }

        public Builder setThumbnailUrl(String thumbnailUrl) {
            this.Fi = thumbnailUrl;
            this.Eq.add(51);
            return this;
        }

        public Builder setTickerSymbol(String tickerSymbol) {
            this.Fj = tickerSymbol;
            this.Eq.add(52);
            return this;
        }

        public Builder setType(String type) {
            this.AI = type;
            this.Eq.add(53);
            return this;
        }

        public Builder setUrl(String url) {
            this.iH = url;
            this.Eq.add(54);
            return this;
        }

        public Builder setWidth(String width) {
            this.Fk = width;
            this.Eq.add(55);
            return this;
        }

        public Builder setWorstRating(String worstRating) {
            this.Fl = worstRating;
            this.Eq.add(56);
            return this;
        }
    }

    ItemScope getAbout();

    List<String> getAdditionalName();

    ItemScope getAddress();

    String getAddressCountry();

    String getAddressLocality();

    String getAddressRegion();

    List<ItemScope> getAssociated_media();

    int getAttendeeCount();

    List<ItemScope> getAttendees();

    ItemScope getAudio();

    List<ItemScope> getAuthor();

    String getBestRating();

    String getBirthDate();

    ItemScope getByArtist();

    String getCaption();

    String getContentSize();

    String getContentUrl();

    List<ItemScope> getContributor();

    String getDateCreated();

    String getDateModified();

    String getDatePublished();

    String getDescription();

    String getDuration();

    String getEmbedUrl();

    String getEndDate();

    String getFamilyName();

    String getGender();

    ItemScope getGeo();

    String getGivenName();

    String getHeight();

    String getId();

    String getImage();

    ItemScope getInAlbum();

    double getLatitude();

    ItemScope getLocation();

    double getLongitude();

    String getName();

    ItemScope getPartOfTVSeries();

    List<ItemScope> getPerformers();

    String getPlayerType();

    String getPostOfficeBoxNumber();

    String getPostalCode();

    String getRatingValue();

    ItemScope getReviewRating();

    String getStartDate();

    String getStreetAddress();

    String getText();

    ItemScope getThumbnail();

    String getThumbnailUrl();

    String getTickerSymbol();

    String getType();

    String getUrl();

    String getWidth();

    String getWorstRating();

    boolean hasAbout();

    boolean hasAdditionalName();

    boolean hasAddress();

    boolean hasAddressCountry();

    boolean hasAddressLocality();

    boolean hasAddressRegion();

    boolean hasAssociated_media();

    boolean hasAttendeeCount();

    boolean hasAttendees();

    boolean hasAudio();

    boolean hasAuthor();

    boolean hasBestRating();

    boolean hasBirthDate();

    boolean hasByArtist();

    boolean hasCaption();

    boolean hasContentSize();

    boolean hasContentUrl();

    boolean hasContributor();

    boolean hasDateCreated();

    boolean hasDateModified();

    boolean hasDatePublished();

    boolean hasDescription();

    boolean hasDuration();

    boolean hasEmbedUrl();

    boolean hasEndDate();

    boolean hasFamilyName();

    boolean hasGender();

    boolean hasGeo();

    boolean hasGivenName();

    boolean hasHeight();

    boolean hasId();

    boolean hasImage();

    boolean hasInAlbum();

    boolean hasLatitude();

    boolean hasLocation();

    boolean hasLongitude();

    boolean hasName();

    boolean hasPartOfTVSeries();

    boolean hasPerformers();

    boolean hasPlayerType();

    boolean hasPostOfficeBoxNumber();

    boolean hasPostalCode();

    boolean hasRatingValue();

    boolean hasReviewRating();

    boolean hasStartDate();

    boolean hasStreetAddress();

    boolean hasText();

    boolean hasThumbnail();

    boolean hasThumbnailUrl();

    boolean hasTickerSymbol();

    boolean hasType();

    boolean hasUrl();

    boolean hasWidth();

    boolean hasWorstRating();
}
