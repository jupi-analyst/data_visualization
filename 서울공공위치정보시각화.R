library(ggmap)

seoultour = read.csv("./data/서울여행지.csv", header = T, fileEncoding = 'euc-kr')
seoultour
seoultour1 = get_map("BONGwoN-DONG", zoom = 13, maptype = "roadmap")
seoulmap = ggmap(seoultour1) + 
  geom_point(data = seoultour,
             aes(x = seoultour$경도, y = seoultour$위도),
             size = 3,
             alpha = 0.8, col = "red")
seoulmap

#선 연결
seoulmap + 
  geom_path(data = seoultour,
                     aes(x = seoultour$경도, y = seoultour$위도),
                     size = 1, linetype = 2, col = "blue") +
  geom_text(data = seoultour,
            aes(x = seoultour$경도, y = seoultour$위도,
            label = 여행지), size = 5, family = 'AppleGothic')

#서울시 공공WIFI정보 시각화
seoulWifi = read.csv("./data/서울시wifi위치정보.csv", header = T, fileEncoding = 'euc-kr')
head(seoulWifi)
gmap = get_map('seoul_si', zoom = 15, maptype = 'roadmap')
seoulWifi_map = ggmap(gmap) + 
  geom_point(data = seoulWifi,
             aes(x = seoulWifi$경도, y = seoulWifi$위도),
             size = 2,
             alpha = 5,
             color = 'red')
seoulWifi_map

seoulWifi_map + 
  geom_text(data = seoulWifi,
            aes(x = seoulWifi$경도, y = seoulWifi$위도+0.01, label = seoulWifi$설치기관.회사),
            siez = 3)

#서울 한강 공원 주차장 
hanParking = read.csv('./data/서울시한강공원주차장.csv', header = T, fileEncoding = 'euc-kr')
head(hanParking)
gmap = get_map('Yongsan-gu', zoom = 12, maptype = 'roadmap')
hanParking_map = ggmap(gmap) +
  geom_point(data = hanParking,
             aes(x = hanParking$경도, y = hanParking$위도),
             size = 2,
             alpha = 5,
             color = 'red')
hanParking_map
hanParking_map + 
  geom_text(data = hanParking,
            aes(x = hanParking$경도, y = hanParking$위도+0.01, label = hanParking$주차장위치),
            size = 3,
            family = 'AppleGothic')
