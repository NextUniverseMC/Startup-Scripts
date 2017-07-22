git add --all
git commit -m "Scheduled Backup"
git push origin master

java  -Xms512M -Dlog4j.configurationFile=log4j2.xml -Dcom.mojang.eula.agree=true -DIReallyKnowWhatIAmDoingISwear=true -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -jar spigot.jar
