
git add --all
git commit -m "Scheduled Backup"
git push origin master

serverid=`cat servernumber.txt`
newvalue=`cat newnumber.txt`
mv -f worlds/ servers/$serverid/
rm -r update
cd plugins/
while read game
do
    mv -f "$game" servers/$serverid/plugins/
done < game-plugins.txt
cd ..
rm -f banned-ips.json
rm -f banned-players.json
mv -f bukkit.yml servers/$serverid
rm -f ops.json
rm -f permissions.yml
mv -f server.properties servers/$serverid
mv -f servernumber.txt servers/$serverid
mv -f spigot.yml servers/$serverid
echo Finished cleanup of old server files, now moving new server files
cp -r servers/$newvalue/worlds/ .
cp servers/$newvalue/plugins/* plugins/
cp servers/$newvalue/bukkit.yml .
cp servers/$newvalue/server.properties .
cp servers/$newvalue/servernumber.txt .
cp servers/$newvalue/spigot.yml .
echo Finished transferal of new server files, starting server
java  -Xms512M -Dlog4j.configurationFile=log4j2.xml -Dcom.mojang.eula.agree=true -DIReallyKnowWhatIAmDoingISwear=true -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -jar spigot.jar
