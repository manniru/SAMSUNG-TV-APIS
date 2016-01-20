./update.sh

echo 'Building app ...'

# Remove old pakcage
[ -d /var/www/html/samsung/AppApisTests.zip ] || rm /var/www/html/samsung/AppApisTests.zip

cat sssp_config.xml | sed "s/<ver.*$/<ver>1.`head -200 /dev/urandom | cksum | cut -f1 -d " "

`<\/ver>/g" > sssp_config2.xml
mv sssp_config2.xml 	sssp_config.xml

cp sssp_config.xml		/var/www/html/samsung/sssp_config.xml
cp sssp_config.xml		/var/www/html/samsung/Apps/sssp_config.xml

echo 'Compressing app ...'
cd AppApisTests
zip -r -q -l AppApisTests.zip .
# git archive -o ../app.zip HEAD

cd..

mv AppApisTests.zip 		/var/www/html/samsung/AppApisTests.zip

echo 'Copying Files to local deploy'
# Copying file to local deploy
rm /var/www/html/samsung/Apps/AppApisTests -Rf
mkdir /var/www/html/samsung/Apps/AppApisTests
cp AppApisTests/* /var/www/html/samsung/Apps/AppApisTests -Rf

#function getVersion(str, tag) {	var match, result = "", regex = /<ver>(.*?)<\/ver>/ig;	while (match = regex.exec(str)) { result += match[1]; }	return result;}
