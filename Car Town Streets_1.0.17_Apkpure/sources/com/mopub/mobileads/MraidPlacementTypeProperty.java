package com.mopub.mobileads;

import com.mopub.mobileads.MraidView;
/* compiled from: MraidProperty.java */
/* loaded from: classes.dex */
class MraidPlacementTypeProperty extends MraidProperty {
    private final MraidView.PlacementType mPlacementType;

    MraidPlacementTypeProperty(MraidView.PlacementType placementType) {
        this.mPlacementType = placementType;
    }

    public static MraidPlacementTypeProperty createWithType(MraidView.PlacementType placementType) {
        return new MraidPlacementTypeProperty(placementType);
    }

    @Override // com.mopub.mobileads.MraidProperty
    public String toJsonPair() {
        return "placementType: '" + this.mPlacementType.toString().toLowerCase() + "'";
    }
}
