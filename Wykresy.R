rm(list=ls())

dane <- read.csv("C:/Users/Walen/Desktop/Praca licencjacka/R/Dane_do_R.csv", sep=";", dec=",", header=TRUE,
                 na.strings="NA", stringsAsFactors=FALSE)

library(dplyr)
library(ggplot2)
library(ggrepel)
library(ggthemes)

dane$Group <- as.factor(dane$Group)

dane %>% ggplot(aes(x=GNI, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("Doch�d Narodowy Brutto per capita, PPP (w obecnym dolarze mi�dzynarodowym)") +
  ylab("Cz�sto�� wyst�powania HIV w�r�d doros�ych (w %)") + labs(col="Grupa") + theme_bw() +
  geom_text_repel()

dane %>% ggplot(aes(x=School, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("�rednia liczba lat edukacji (w latach)") +
  ylab("Cz�sto�� wyst�powania HIV w�r�d doros�ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=CHE, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("Bie��ce wydatki na zdrowie per capita (w PPP w dolarze mi�dzynarodowym)") +
  ylab("Cz�sto�� wyst�powania HIV w�r�d doros�ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=Life_exp, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("Oczekiwana d�ugo�� trwania �ycia (w latach)") +
  ylab("Cz�sto�� wyst�powania HIV w�r�d doros�ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=ART., y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("Ludzie �yj�cy z HIV otrzymuj�cy leczenie ART (w %)") +
  ylab("Cz�sto�� wyst�powania HIV w�r�d doros�ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=Poverty, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("") +
  ylab("Cz�sto�� wyst�powania HIV w�r�d doros�ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=Country)) + geom_bar(aes(weight=Share_2000.2005, fill=Group, order(Group))) + theme_bw() +
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("") + coord_flip() +
  ylab("Udzia� zgon�w zwi�zanych z AIDS w ca�kowitej liczbie zgon�w (w %)") + labs(col="Grupa") +
  scale_x_discrete(breaks=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21"), 
                   labels=c("Botswana","Namibia","RPA", "Burundi","Mozambik","Somalia","Sudan P�d","Lesotho","Swaziland","Zimbabwe","D�ibuti","Komory","Madagaskar","Erytrea","Etiopia","Kenia","Malawi","Rwanda","Tanzania","Uganda","Zambia"))
