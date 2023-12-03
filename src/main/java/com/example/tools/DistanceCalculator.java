package com.example.tools;

public class DistanceCalculator {
    public int calculateDistanceInKilometer(String lat1Str, String lon1Str, String lat2Str, String lon2Str) {
        final int R = 6371; // 지구의 반지름 (킬로미터 단위)

        double lat1 = Double.parseDouble(lat1Str);
        double lon1 = Double.parseDouble(lon1Str);
        double lat2 = Double.parseDouble(lat2Str);
        double lon2 = Double.parseDouble(lon2Str);

        double latDistance = Math.toRadians(lat2 - lat1);
        double lonDistance = Math.toRadians(lon2 - lon1);

        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
                 + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                 * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);

        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double distance = R * c; // 거리 계산

        return (int)distance;
    }
}
