rm(list=ls())

dane <- read.csv("C:/Users/Walen/Desktop/Praca licencjacka/R/Dane_do_R.csv", sep=";", dec=",", header=TRUE,
                 na.strings="NA", stringsAsFactors=FALSE)

library(dplyr)
library(ggplot2)
library(ggrepel)
library(ggthemes)

dane$Group <- as.factor(dane$Group)

dane %>% ggplot(aes(x=GNI, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("Dochód Narodowy Brutto per capita, PPP (w obecnym dolarze miêdzynarodowym)") +
  ylab("Czêstoœæ wystêpowania HIV wœród doros³ych (w %)") + labs(col="Grupa") + theme_bw() +
  geom_text_repel()

dane %>% ggplot(aes(x=School, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("Œrednia liczba lat edukacji (w latach)") +
  ylab("Czêstoœæ wystêpowania HIV wœród doros³ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=CHE, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("Bie¿¹ce wydatki na zdrowie per capita (w PPP w dolarze miêdzynarodowym)") +
  ylab("Czêstoœæ wystêpowania HIV wœród doros³ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=Life_exp, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("Oczekiwana d³ugoœæ trwania ¿ycia (w latach)") +
  ylab("Czêstoœæ wystêpowania HIV wœród doros³ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=ART., y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("Ludzie ¿yj¹cy z HIV otrzymuj¹cy leczenie ART (w %)") +
  ylab("Czêstoœæ wystêpowania HIV wœród doros³ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=Poverty, y=HIV_P, color=Group, label=Country)) + geom_point(size=2) + 
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("") +
  ylab("Czêstoœæ wystêpowania HIV wœród doros³ych (w %)") + labs(col="Grupa") + theme_bw() + geom_text_repel()

dane %>% ggplot(aes(x=Country)) + geom_bar(aes(weight=Share_2000.2005, fill=Group, order(Group))) + theme_bw() +
  scale_color_brewer(type="qual", palette=6, direction=1) + xlab("") + coord_flip() +
  ylab("Udzia³ zgonów zwi¹zanych z AIDS w ca³kowitej liczbie zgonów (w %)") + labs(col="Grupa") +
  scale_x_discrete(breaks=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21"), 
                   labels=c("Botswana","Namibia","RPA", "Burundi","Mozambik","Somalia","Sudan P³d","Lesotho","Swaziland","Zimbabwe","DŸibuti","Komory","Madagaskar","Erytrea","Etiopia","Kenia","Malawi","Rwanda","Tanzania","Uganda","Zambia"))
