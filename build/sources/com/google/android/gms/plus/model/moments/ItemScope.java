package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.internal.C1402ib;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public interface ItemScope extends Freezable<ItemScope> {

    public static class Builder {

        /* renamed from: AI */
        private String f3752AI;

        /* renamed from: EA */
        private C1402ib f3753EA;

        /* renamed from: EB */
        private List<C1402ib> f3754EB;

        /* renamed from: EC */
        private String f3755EC;

        /* renamed from: ED */
        private String f3756ED;

        /* renamed from: EE */
        private C1402ib f3757EE;

        /* renamed from: EF */
        private String f3758EF;

        /* renamed from: EG */
        private String f3759EG;

        /* renamed from: EH */
        private String f3760EH;

        /* renamed from: EI */
        private List<C1402ib> f3761EI;

        /* renamed from: EJ */
        private String f3762EJ;

        /* renamed from: EK */
        private String f3763EK;

        /* renamed from: EL */
        private String f3764EL;

        /* renamed from: EM */
        private String f3765EM;

        /* renamed from: EN */
        private String f3766EN;

        /* renamed from: EO */
        private String f3767EO;

        /* renamed from: EP */
        private String f3768EP;

        /* renamed from: EQ */
        private String f3769EQ;

        /* renamed from: ER */
        private C1402ib f3770ER;

        /* renamed from: ES */
        private String f3771ES;

        /* renamed from: ET */
        private String f3772ET;

        /* renamed from: EU */
        private String f3773EU;

        /* renamed from: EV */
        private C1402ib f3774EV;

        /* renamed from: EW */
        private C1402ib f3775EW;

        /* renamed from: EX */
        private C1402ib f3776EX;

        /* renamed from: EY */
        private List<C1402ib> f3777EY;

        /* renamed from: EZ */
        private String f3778EZ;

        /* renamed from: Eq */
        private final Set<Integer> f3779Eq = new HashSet();

        /* renamed from: Er */
        private C1402ib f3780Er;

        /* renamed from: Es */
        private List<String> f3781Es;

        /* renamed from: Et */
        private C1402ib f3782Et;

        /* renamed from: Eu */
        private String f3783Eu;

        /* renamed from: Ev */
        private String f3784Ev;

        /* renamed from: Ew */
        private String f3785Ew;

        /* renamed from: Ex */
        private List<C1402ib> f3786Ex;

        /* renamed from: Ey */
        private int f3787Ey;

        /* renamed from: Ez */
        private List<C1402ib> f3788Ez;

        /* renamed from: Fa */
        private String f3789Fa;

        /* renamed from: Fb */
        private String f3790Fb;

        /* renamed from: Fc */
        private String f3791Fc;

        /* renamed from: Fd */
        private C1402ib f3792Fd;

        /* renamed from: Fe */
        private String f3793Fe;

        /* renamed from: Ff */
        private String f3794Ff;

        /* renamed from: Fg */
        private String f3795Fg;

        /* renamed from: Fh */
        private C1402ib f3796Fh;

        /* renamed from: Fi */
        private String f3797Fi;

        /* renamed from: Fj */
        private String f3798Fj;

        /* renamed from: Fk */
        private String f3799Fk;

        /* renamed from: Fl */
        private String f3800Fl;

        /* renamed from: iH */
        private String f3801iH;
        private String mName;

        /* renamed from: sJ */
        private String f3802sJ;

        /* renamed from: uS */
        private String f3803uS;

        /* renamed from: xw */
        private double f3804xw;

        /* renamed from: xx */
        private double f3805xx;

        public ItemScope build() {
            return new C1402ib(this.f3779Eq, this.f3780Er, this.f3781Es, this.f3782Et, this.f3783Eu, this.f3784Ev, this.f3785Ew, this.f3786Ex, this.f3787Ey, this.f3788Ez, this.f3753EA, this.f3754EB, this.f3755EC, this.f3756ED, this.f3757EE, this.f3758EF, this.f3759EG, this.f3760EH, this.f3761EI, this.f3762EJ, this.f3763EK, this.f3764EL, this.f3802sJ, this.f3765EM, this.f3766EN, this.f3767EO, this.f3768EP, this.f3769EQ, this.f3770ER, this.f3771ES, this.f3772ET, this.f3803uS, this.f3773EU, this.f3774EV, this.f3804xw, this.f3775EW, this.f3805xx, this.mName, this.f3776EX, this.f3777EY, this.f3778EZ, this.f3789Fa, this.f3790Fb, this.f3791Fc, this.f3792Fd, this.f3793Fe, this.f3794Ff, this.f3795Fg, this.f3796Fh, this.f3797Fi, this.f3798Fj, this.f3752AI, this.f3801iH, this.f3799Fk, this.f3800Fl);
        }

        public Builder setAbout(ItemScope about) {
            this.f3780Er = (C1402ib) about;
            this.f3779Eq.add(2);
            return this;
        }

        public Builder setAdditionalName(List<String> additionalName) {
            this.f3781Es = additionalName;
            this.f3779Eq.add(3);
            return this;
        }

        public Builder setAddress(ItemScope address) {
            this.f3782Et = (C1402ib) address;
            this.f3779Eq.add(4);
            return this;
        }

        public Builder setAddressCountry(String addressCountry) {
            this.f3783Eu = addressCountry;
            this.f3779Eq.add(5);
            return this;
        }

        public Builder setAddressLocality(String addressLocality) {
            this.f3784Ev = addressLocality;
            this.f3779Eq.add(6);
            return this;
        }

        public Builder setAddressRegion(String addressRegion) {
            this.f3785Ew = addressRegion;
            this.f3779Eq.add(7);
            return this;
        }

        public Builder setAssociated_media(List<ItemScope> associated_media) {
            this.f3786Ex = associated_media;
            this.f3779Eq.add(8);
            return this;
        }

        public Builder setAttendeeCount(int attendeeCount) {
            this.f3787Ey = attendeeCount;
            this.f3779Eq.add(9);
            return this;
        }

        public Builder setAttendees(List<ItemScope> attendees) {
            this.f3788Ez = attendees;
            this.f3779Eq.add(10);
            return this;
        }

        public Builder setAudio(ItemScope audio) {
            this.f3753EA = (C1402ib) audio;
            this.f3779Eq.add(11);
            return this;
        }

        public Builder setAuthor(List<ItemScope> author) {
            this.f3754EB = author;
            this.f3779Eq.add(12);
            return this;
        }

        public Builder setBestRating(String bestRating) {
            this.f3755EC = bestRating;
            this.f3779Eq.add(13);
            return this;
        }

        public Builder setBirthDate(String birthDate) {
            this.f3756ED = birthDate;
            this.f3779Eq.add(14);
            return this;
        }

        public Builder setByArtist(ItemScope byArtist) {
            this.f3757EE = (C1402ib) byArtist;
            this.f3779Eq.add(15);
            return this;
        }

        public Builder setCaption(String caption) {
            this.f3758EF = caption;
            this.f3779Eq.add(16);
            return this;
        }

        public Builder setContentSize(String contentSize) {
            this.f3759EG = contentSize;
            this.f3779Eq.add(17);
            return this;
        }

        public Builder setContentUrl(String contentUrl) {
            this.f3760EH = contentUrl;
            this.f3779Eq.add(18);
            return this;
        }

        public Builder setContributor(List<ItemScope> contributor) {
            this.f3761EI = contributor;
            this.f3779Eq.add(19);
            return this;
        }

        public Builder setDateCreated(String dateCreated) {
            this.f3762EJ = dateCreated;
            this.f3779Eq.add(20);
            return this;
        }

        public Builder setDateModified(String dateModified) {
            this.f3763EK = dateModified;
            this.f3779Eq.add(21);
            return this;
        }

        public Builder setDatePublished(String datePublished) {
            this.f3764EL = datePublished;
            this.f3779Eq.add(22);
            return this;
        }

        public Builder setDescription(String description) {
            this.f3802sJ = description;
            this.f3779Eq.add(23);
            return this;
        }

        public Builder setDuration(String duration) {
            this.f3765EM = duration;
            this.f3779Eq.add(24);
            return this;
        }

        public Builder setEmbedUrl(String embedUrl) {
            this.f3766EN = embedUrl;
            this.f3779Eq.add(25);
            return this;
        }

        public Builder setEndDate(String endDate) {
            this.f3767EO = endDate;
            this.f3779Eq.add(26);
            return this;
        }

        public Builder setFamilyName(String familyName) {
            this.f3768EP = familyName;
            this.f3779Eq.add(27);
            return this;
        }

        public Builder setGender(String gender) {
            this.f3769EQ = gender;
            this.f3779Eq.add(28);
            return this;
        }

        public Builder setGeo(ItemScope geo) {
            this.f3770ER = (C1402ib) geo;
            this.f3779Eq.add(29);
            return this;
        }

        public Builder setGivenName(String givenName) {
            this.f3771ES = givenName;
            this.f3779Eq.add(30);
            return this;
        }

        public Builder setHeight(String height) {
            this.f3772ET = height;
            this.f3779Eq.add(31);
            return this;
        }

        public Builder setId(String id) {
            this.f3803uS = id;
            this.f3779Eq.add(32);
            return this;
        }

        public Builder setImage(String image) {
            this.f3773EU = image;
            this.f3779Eq.add(33);
            return this;
        }

        public Builder setInAlbum(ItemScope inAlbum) {
            this.f3774EV = (C1402ib) inAlbum;
            this.f3779Eq.add(34);
            return this;
        }

        public Builder setLatitude(double latitude) {
            this.f3804xw = latitude;
            this.f3779Eq.add(36);
            return this;
        }

        public Builder setLocation(ItemScope location) {
            this.f3775EW = (C1402ib) location;
            this.f3779Eq.add(37);
            return this;
        }

        public Builder setLongitude(double longitude) {
            this.f3805xx = longitude;
            this.f3779Eq.add(38);
            return this;
        }

        public Builder setName(String name) {
            this.mName = name;
            this.f3779Eq.add(39);
            return this;
        }

        public Builder setPartOfTVSeries(ItemScope partOfTVSeries) {
            this.f3776EX = (C1402ib) partOfTVSeries;
            this.f3779Eq.add(40);
            return this;
        }

        public Builder setPerformers(List<ItemScope> performers) {
            this.f3777EY = performers;
            this.f3779Eq.add(41);
            return this;
        }

        public Builder setPlayerType(String playerType) {
            this.f3778EZ = playerType;
            this.f3779Eq.add(42);
            return this;
        }

        public Builder setPostOfficeBoxNumber(String postOfficeBoxNumber) {
            this.f3789Fa = postOfficeBoxNumber;
            this.f3779Eq.add(43);
            return this;
        }

        public Builder setPostalCode(String postalCode) {
            this.f3790Fb = postalCode;
            this.f3779Eq.add(44);
            return this;
        }

        public Builder setRatingValue(String ratingValue) {
            this.f3791Fc = ratingValue;
            this.f3779Eq.add(45);
            return this;
        }

        public Builder setReviewRating(ItemScope reviewRating) {
            this.f3792Fd = (C1402ib) reviewRating;
            this.f3779Eq.add(46);
            return this;
        }

        public Builder setStartDate(String startDate) {
            this.f3793Fe = startDate;
            this.f3779Eq.add(47);
            return this;
        }

        public Builder setStreetAddress(String streetAddress) {
            this.f3794Ff = streetAddress;
            this.f3779Eq.add(48);
            return this;
        }

        public Builder setText(String text) {
            this.f3795Fg = text;
            this.f3779Eq.add(49);
            return this;
        }

        public Builder setThumbnail(ItemScope thumbnail) {
            this.f3796Fh = (C1402ib) thumbnail;
            this.f3779Eq.add(50);
            return this;
        }

        public Builder setThumbnailUrl(String thumbnailUrl) {
            this.f3797Fi = thumbnailUrl;
            this.f3779Eq.add(51);
            return this;
        }

        public Builder setTickerSymbol(String tickerSymbol) {
            this.f3798Fj = tickerSymbol;
            this.f3779Eq.add(52);
            return this;
        }

        public Builder setType(String type) {
            this.f3752AI = type;
            this.f3779Eq.add(53);
            return this;
        }

        public Builder setUrl(String url) {
            this.f3801iH = url;
            this.f3779Eq.add(54);
            return this;
        }

        public Builder setWidth(String width) {
            this.f3799Fk = width;
            this.f3779Eq.add(55);
            return this;
        }

        public Builder setWorstRating(String worstRating) {
            this.f3800Fl = worstRating;
            this.f3779Eq.add(56);
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
