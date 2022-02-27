-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: verkkokaupat
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `area_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) NOT NULL,
  `area_link` varchar(50) NOT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `area_name` (`area_name`),
  UNIQUE KEY `area_link` (`area_link`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Helsinki','helsinki'),(2,'Espoo','espoo'),(3,'Vantaa','vantaa'),(4,'Pirkkala','pirkkala'),(5,'Kontiolahti','kontiolahti'),(6,'Joensuu','joensuu'),(7,'Iisalmi','iisalmi'),(8,'Loimaa','loimaa'),(9,'Savonlinna','savonlinna'),(10,'Nurmijärvi','nurmijarvi'),(11,'Kruunupyy','kruunupyy'),(12,'Lempäälä','lempaala'),(13,'Kurikka','kurikka'),(14,'Kalajoki','kalajoki'),(15,'Pori','pori'),(16,'Tuusula','tuusula'),(17,'Kemi','kemi'),(18,'Lahti','lahti'),(19,'Varkaus','varkaus'),(20,'Lappeenranta','lappeenranta'),(21,'Raahe','raahe'),(22,'Seinäjoki','seinajoki'),(23,'Paimio','paimio'),(24,'Mikkeli','mikkeli'),(25,'Tampere','tampere'),(26,'Laitila','laitila'),(27,'Rauma','rauma'),(28,'Turku','turku'),(29,'Ähtäri','ahtari'),(30,'Kristiinankaupunki','kristiinankaupunki'),(31,'Kihniö','kihnio'),(32,'Lohja','lohja'),(33,'Oulu','oulu'),(34,'Ylivieska','ylivieska'),(35,'Raisio','raisio'),(36,'Hausjärvi','hausjarvi'),(37,'Liminka','liminka'),(38,'Jyväskylä','jyvaskyla'),(39,'Kainuu','kainuu'),(40,'Uusikaupunki','uusikaupunki'),(41,'Asiakkala','asiakkala'),(42,'Rovaniemi','rovaniemi'),(43,'Hyvinkää','hyvinkaa'),(44,'Rautjärvi','rautjarvi'),(45,'Luoto','luoto'),(46,'Kajaani','kajaani'),(47,'Keuruu','keuruu'),(48,'Kangasala','kangasala'),(49,'Ikaalinen','ikaalinen'),(50,'Liperi','liperi'),(51,'Kerava','kerava'),(52,'Kuopio','kuopio'),(53,'Mäntsälä','mantsala'),(54,'Punkalaidun','punkalaidun'),(55,'Kangasniemi','kangasniemi');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `link_store` int(11) NOT NULL,
  `link_tag` mediumint(9) NOT NULL,
  KEY `links_FK` (`link_store`),
  KEY `links_FK_1` (`link_tag`),
  CONSTRAINT `links_FK` FOREIGN KEY (`link_store`) REFERENCES `stores` (`store_id`) ON UPDATE CASCADE,
  CONSTRAINT `links_FK_1` FOREIGN KEY (`link_tag`) REFERENCES `tags` (`tag_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,1),(2,4),(3,8),(3,9),(4,9),(5,2),(5,3),(5,23),(6,2),(6,3),(7,6),(8,6),(9,5),(9,10),(10,10),(11,1),(11,16),(12,2),(12,3),(13,2),(13,3),(13,31),(1,27),(10,5),(1,11),(16,31),(16,11),(16,14),(17,37),(18,24),(18,1),(19,39),(19,38),(20,12),(20,14),(21,40),(22,26),(23,1),(23,31),(23,14),(23,11),(23,26),(25,33),(25,26),(26,26),(26,33),(27,26),(27,41),(27,28),(24,41),(24,26),(28,12),(28,14),(28,42),(28,16),(29,16),(29,42),(30,33),(31,16),(31,12),(14,14),(14,1),(14,27),(14,11),(14,31),(14,40),(14,12),(15,43),(15,1),(15,26),(32,1),(32,27),(33,6),(33,42),(33,39),(34,14),(34,48),(34,1),(34,40),(34,2),(34,12),(35,16),(35,44),(35,48),(36,45),(37,2),(37,31),(37,28),(37,11),(37,12),(16,27),(38,44),(38,42),(38,46),(38,47),(39,10),(40,1),(40,11),(40,40),(40,16),(41,31),(41,40),(41,42),(41,12),(41,14),(42,39),(42,9),(43,2),(43,27),(44,31),(44,1),(44,12),(44,16),(44,2),(44,14),(44,3),(45,16),(45,48),(46,12),(46,14),(46,31),(46,27),(46,40),(46,42),(46,11),(46,16),(46,48),(47,2),(48,28),(48,26),(49,48),(49,31),(50,27),(50,1),(50,14),(51,12),(51,31),(51,42),(51,6),(51,14),(51,27),(52,2),(53,23),(53,48),(54,48),(54,27),(54,47),(54,26),(55,11),(55,12),(55,14),(55,37),(55,48),(54,44),(56,27),(56,39),(56,47),(57,1),(58,11),(58,14),(58,1),(59,14),(59,1),(60,10),(60,26),(60,2),(61,26),(61,1),(62,1),(63,45),(63,26),(63,48),(63,11),(64,1),(64,14),(64,27),(64,12),(64,16),(65,2),(65,48),(65,11),(66,10),(67,48),(67,16),(68,10),(68,5),(69,3),(69,2),(69,27),(69,1),(70,31),(70,12),(71,1),(71,31),(71,12),(71,48),(71,40),(71,44),(71,28),(71,4),(71,50),(71,49),(71,45),(72,14),(72,10),(73,45),(73,51),(73,53),(73,51),(73,54),(73,2),(74,47),(74,45),(74,51),(75,1),(75,40),(76,48),(77,43),(77,9),(78,31),(78,3),(78,2),(78,53),(78,12),(78,26),(78,45),(78,28),(79,26),(79,33),(80,12),(80,31),(80,48),(81,2),(81,48),(81,23),(82,1),(83,27),(83,48),(83,33),(84,2),(84,44),(84,23),(84,10),(83,47),(85,45),(85,26),(85,49),(87,48),(87,16),(88,10),(89,9),(89,26),(90,10),(91,23),(91,26),(91,2),(91,27),(91,1),(91,24),(92,16),(92,48),(93,43),(93,45),(94,54),(95,48),(95,16),(96,26),(96,28),(97,26),(97,10),(98,26),(98,1),(98,24),(99,16),(99,48),(99,1),(100,26),(100,48),(100,12),(100,42),(101,28),(102,48),(102,1),(103,48),(103,11),(103,1),(104,1),(104,26),(105,45),(105,48),(105,26),(105,47),(105,4),(105,49),(105,51),(105,52),(105,50),(105,43),(105,31),(106,16),(106,1),(106,27),(107,26),(107,4),(107,1),(107,27),(108,2),(108,48),(109,1),(109,11),(109,16),(109,48);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platforms` (
  `cms_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cms_title` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`cms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,'Tuspe'),(2,'Woocommerce'),(3,'Shopify'),(4,'Vilkas'),(6,'Elisa'),(7,'Clover Shop'),(8,'Finqu'),(9,'Holvi'),(10,'Amazon'),(11,'Kotisivukone'),(12,'MyCashflow'),(13,'OpenCart');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_title` varchar(100) NOT NULL,
  `store_area` smallint(4) DEFAULT NULL,
  `store_company` varchar(100) NOT NULL,
  `store_link` varchar(100) NOT NULL,
  `store_desc` varchar(160) NOT NULL,
  `store_cms` smallint(6) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `store_link` (`store_link`),
  UNIQUE KEY `store_title` (`store_title`),
  KEY `stores_FK` (`store_cms`),
  KEY `store_area` (`store_area`),
  CONSTRAINT `stores_FK` FOREIGN KEY (`store_cms`) REFERENCES `platforms` (`cms_id`) ON UPDATE CASCADE,
  CONSTRAINT `stores_area` FOREIGN KEY (`store_area`) REFERENCES `areas` (`area_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Navy Blue Store',1,'Oy Navy Blue Trading Ltd','https://navyblue.fi/','Aktiivisten ihmisten merkkivaate- ja kenkämyymälä.',1,'2022-01-20 22:34:33'),(2,'Kupilka',5,'Plasthill Oy','https://kupilka.fi/tuotteet/','Luonnossa liikkujan paras kaveri! Ekologiset ja kierrätettävät astiat, puukot ja tulukset ulkoiluhetkiin.',2,'2022-01-20 22:35:02'),(3,'Omamuutto',6,'Kuljetusliike Kettunen Oy','https://www.omamuutto.fi/muuttotarvikkeet','Omatoimiset muutot kunnon välineillä tai ammattilaisen auttamana. Osta tai vuokraa muuttovälineet Joensuun alueella.',1,'2020-04-27 23:12:06'),(4,'Joensuun konevuokraamo',6,'Joensuun Konevuokraamo Ky','https://joensuunkonevuokraamo.fi/','Koneiden vuokraus- ja myyntitoimintaa harjoittava täyden palvelun konevuokraamo.',1,'2020-04-27 23:12:42'),(5,'OLO Nordic',7,'Mieliyrtti Oy','https://olonordic.fi/','OLO Nordic verkkokaupasta hyvä valikoima suomalaisia yrttejä, laadukkaita luonnonkosmetiikkatuotteita kasvojen, vartalon ja hiusten hoitoon.',2,'2020-04-27 23:14:40'),(6,'Beauty and the beards',NULL,'','https://beautyandthebeards.fi/','Kauneuden ja hyvinvoinnin kauppa.',2,'2020-04-27 23:16:42'),(7,'Mainosjuliste',7,'Kopio-Raksa Oy','https://www.mainosjuliste.fi/','Iisalmelaisen kopio- ja tulostusalan erikoisliike Kopio-Raksan verkkokauppa. Julisteet ja mainostelineet.',NULL,'2020-04-27 23:19:00'),(8,'Raksakuvat',7,'Kopio-Raksa Oy','https://raksakuvat.fi/verkkokauppa/','Helppo ja nopea tapa tilata rakennuspiirustustulosteet.',2,'2020-04-27 23:19:43'),(9,'Teenne',8,'Teenne','https://teenne.fi/kauppa/','Sosiaaliseen mediaan erikoistunut verkkokauppa. Somevalmennuksesta laajaan ylläpitoon.',2,'2020-04-27 23:21:50'),(10,'Ilona Works',1,'Ilona Works Finland Oy','https://ilona.works/','Yrittäjä tai pienyritys - Vertaa ja osta tarvitsemasi liiketoiminnan tukipalvelut yrittäjien verkkokaupasta.',NULL,'2020-04-27 23:23:18'),(11,'Ninka',2,'Ninka Oy','https://ninka.fi/collections/all?ls=fi','Muoti- ja asustekauppa.',3,'2020-04-27 23:24:09'),(12,'Kauneuskeskus Ruusunen',9,'Hyvänolon kauneuskeskus Ruusunen','https://ruusunen.info/','Hyvänolon Kauneuskeskus Ruusunen on Savonlinnan ydinkeskustassa sijaitseva monipuolinen terveyttä ja kauneutta ylläpitävä hyvänolon hoitola.',1,'2021-03-03 23:27:19'),(13,'Rillastiinan fiilis',10,'Rillastiinan fiilis','https://www.rillastiinanfiilis.fi/rillastiinanshop/','Rillastiinanshopista saat hyvinvointia sisäisesti ja ulkoisesti. Valikoimasta löydät mm. luonnonkosmetiikkaa, hemmottelua sekä muuta ihanaa arjen iloksi.',2,'2020-04-27 23:27:42'),(14,'PaaPii Design',11,'PaaPii Design Oy','https://www.paapiidesign.com/fi','Kotimaiset, ekologiset tekstiili-, sisustus- ja lahjatuotteet. Tilaa PaaPiin uniikit kuosit netistä itsellesi tai lahjaksi!',NULL,'2020-04-27 23:28:57'),(15,'Ton-Up Store',12,'Tmi Hoochie Koo','https://www.tonupstore.com/','Vintage-henkisten moottoripyörävarusteiden ja kustom kulttuuriin kumartavan vaatetuksen verkkokauppa. Erityisesti vuosien 1950-70 väliin osuva tyylikuvasto.',12,'2020-04-27 23:34:18'),(16,'Lennol',13,'Lennol Oy','https://kuluttajat.lennol.fi/','Valikoimasta löytyy sisustustekstiilejä makuuhuoneen, kylpyhuoneen ja olohuoneen sisustukseen. Monipuolinen valikoima.',1,'2021-03-03 23:27:56'),(17,'Kylttipiste',14,'Kylttipiste Oy','https://kylttipiste.fi/','Määräysten mukaiset kyltit ja kilvet moneen tarpeeseen. Meiltä myös määräysten mukaiset moottoriurheilun kilpanumerot sekä venerekisterinumerot.',2,'2020-04-27 23:36:23'),(18,'Salibandyliiton Fanikauppa',NULL,'','https://fanikauppa.salibandy.fi/','Laadukkaat tuotteet maajoukkueen fanittamiseen ja vapaa-aikaan.',NULL,'2020-04-27 23:42:25'),(19,'Karkelokauppa',15,'Online Smugglers Oy','https://karkelokauppa.fi/','Karkelokauppa on vuonna 2019 perustettu leivonta- ja juhlatarvikekauppa Porissa ja verkossa.',2,'2020-04-27 23:45:40'),(20,'Zirbaslife Design',16,'Zirbaslife Design Oy','https://www.zirbaslife.fi/','Kotimaassa painetut sisustus-ja verhoilukankaat ja valmiit sisustustuotteet myös asiakkaan omasta kuvasta!',NULL,'2020-04-27 23:46:43'),(21,'Kemin Laukku',17,'Kemin Laukku Oy','https://www.keminlaukku.fi/','Asiantuntevaa ja ystävällistä palvelua vuodesta 1962. Käsilaukut joka tyyliin, arkeen ja myös juhlaan.',NULL,'2020-04-27 23:47:52'),(22,'Paint & Party',18,'Good Vibes Finland Oy','https://www.paintparty.fi/kauppa','Tuomme luoksesi valmiit maalauspaketit! Mikä olisikaan rentouttavampi tapa viettää karanteenipäivää! Luovuutta, rentoa tekemistä ja valitsemasi juoma kädessäsi.',NULL,'2020-04-27 23:49:20'),(23,'Dream Circus',19,'Dream Circus Oy','https://www.dreamcircus.fi/','ehta by Dream Circus -tuotteet ovat joskus värikkäitä, joskus tummanpuhuvia, mutta aina leikkisiä ja hauskoja hyvänmielentuotteita.',NULL,'2020-04-27 23:52:17'),(24,'Tallin tarvike',6,'Ninan Talli & Tarvike','https://www.tallitarvike.fi/','Käytettyjen hevostarvikkeiden verkkokauppa. Osta ja myy käytettyjä hevostarvikkeita turvallisesti ja sujuvasti.',NULL,'2020-04-27 23:52:38'),(25,'Lahden musiikki',18,'Lahden Musiikki Ky musiikkiliike','https://www.lahdenmusiikki.fi/verkkokauppa/','Lahden Musiikki on musiikkialan monitoimiyritys. Toimintamme perustuu hyvään asiakaslähtöiseen palveluun, ammattitaitoon ja pitkään kokemukseen.',NULL,'2020-04-27 23:54:02'),(26,'F-Musiikki',1,'F-Musiikki Oy','https://www.f-musiikki.fi/','Suomen suurin soitinkauppa! F-Musiikki on musiikkikauppa, josta löydät kaikki tarvittavat soittimet, nuotit ja soitintarvikkeet.',NULL,'2020-04-27 23:54:52'),(27,'Iloinen Kirsu',20,'Dogs & Humans Oy','https://iloinenkirsu.fi/','Iloisessa Kirsussa myydään koirien hyvinvoinnin päivittäisiä tuotteita kuten ruokaa, ravintovalmisteita ja luita sekä  ihon ja turkinhoidon aineita.',3,'2020-04-27 23:56:17'),(28,'DeZio',21,'DeZio','https://dezio.fi/tuotteet/','Verkkokauppa tarjoaa tuotteita jotka ovat rohkeita, modernisti ajattomia ja edustavat uutta suunnittelua ja designia.',2,'2020-04-27 23:58:57'),(29,'Välisuon Prinsessa',NULL,'','https://valisuonprinsessa.vilkasstore.com/','Yhden naisen voimin pyörivä taide- ja käsityö verkkokauppa Keski-Suomessa.',4,'2020-04-28 00:00:47'),(30,'Soitintukku',22,'Musiikki Järvenpää Oy','https://www.soitintukku.fi/','Seinäjoella toimiva musiikkikauppa ja soittimien erikoisliike. Valikoimaan kuuluvat kaikki soittimet, nuotit, soitintarvikkeet ja äänentoistolaitteet.',NULL,'2020-04-28 00:02:43'),(31,'Sussie',23,'Sussie','https://www.sussie.fi/shop/','Valikoimassa on suomalaisia tuotteita useilta suunnittelijoilta, eettisiä tuotteita, joiden takaa löytyy mielenkiintoisia tarinoita.',2,'2020-04-28 00:05:54'),(32,'Ihania',1,'Design ihania','https://www.ihania.fi/','Tavoitteena valmistaa laadukkaita, kauniita ja käytännöllisiä vaatteita ja asusteita naisille ja lapsille.',2,'2020-04-28 00:06:33'),(33,'Kohteessa',9,'Kohteessa','https://kohteessa.fi/','Kotimaiset ja ekologiset paperituotteet; julisteet sisustamiseen, kortit sekä lahjapaperit paketointiin, vihkot muistiinpanoillesi sekä seinäkalenterit.',3,'2020-04-28 00:07:18'),(34,'Riitta Nykänen',24,'Nykänen Riitta Kaarina','https://rnykanen.omaverkkokauppa.fi/','Ompelu- ja suunnittelupalvelua ja tekstiilien luovaa uusiokäyttöä. Persoonallisia lahjatuotteita.',4,'2020-04-28 00:10:59'),(35,'Pliide',1,'Pliide Tmi','https://pliide.fi/kauppa/','Pliiden pajalla on syntynyt persoonallisia ja käytännöllisiä Handmade by Riikka -tuotteita vuodesta 2014 alkaen.',2,'2020-04-28 00:11:41'),(36,'JH Tukku',20,'JH Tukku','https://kauppa.jhtukku.fi/kauppa/','Autoelektroniikkaa, antennituotteet ja yrityspalvelut.',2,'2020-04-28 00:14:00'),(37,'Saaren Taika Shop',NULL,'','https://shop.saarentaika.com/','Vaativankin ihonhoitoon sopivat Saaren Taika tuotteet on suunniteltu alunperin tuotteiden kehittäjän omiin hankaliin iho-ongelmiin.',3,'2020-04-28 00:17:07'),(38,'Lukutoukan kirjakauppa',1,'Oy Töölön Paperi Ab','https://kirjakauppias.fi/','Kirjoja lapsille, nuorille ja aikuisille.',6,'2020-04-28 00:19:28'),(39,'Tuplaamo',25,'Oy TuloksenTuplausToimisto Ab','https://tuplaamo.fi/putiikki','Koulutuksia myynnistä, markkinoinnista, nuorille myynnin ja asiakaspalvelun koulutusta.',2,'2020-04-28 00:23:13'),(40,'Upcycler Helsinki',1,'Upcycler Helsinki Oy','https://upcyclerhelsinki.com/','Vaatteita, laukkuja ja koruja suomalaisilta pienyrityksistä. Materiaalit kierrätettyä, ylijäämää tai käytettyä.',3,'2020-04-28 00:24:58'),(41,'Puutarhurin maja',25,'Puutarhurin Maja Oy','https://puutarhurinmaja.fi/','Puutarhurin Majan puodista löydät kaikkea ihanaa kotiin ja puutarhaan! Verkkokauppa ja varastopuoti Tampereella.',2,'2020-04-28 00:26:42'),(42,'Foamparty',1,'Stubbe & Co Oy','https://www.foamparty.fi/','Vuokraa yksityisille ja yrityksille vaahto- ja T-paita-tykit, saippuakuplakoneet ja confettipuhaltimet sekä tarvittavat aineet.',1,'2020-04-28 00:28:01'),(43,'Hampaille',25,'SmilePower Oy','https://www.hampaille.fi/','Ensimmäinen suun hyvinvointia edistävä suomalainen verkkokauppa. Ammattilaisten suosittelemat kotihoitotuotteet helposti.',NULL,'2020-04-28 00:29:12'),(44,'Maamme kauppa',26,'Suosiva Oy','https://www.maammekauppa.fi/','Valikoimistamme voit löytää ainoastaan Suomessa valmistettuja tuotteita. Nyt ja aina.',2,'2020-04-28 00:31:42'),(45,'Ilona Koru',27,'Idomiracles Oy','https://www.ilonakoru.fi/','Koruja suurella sydämellä.',3,'2020-04-28 00:33:47'),(46,'KOTONA sisustus',28,'handmade by KOTONA','https://www.kotonasisustus.fi/','Valikoimasta löytyy esim. suositut vohvelipyyhkeet, sauna- ja keittiötekstiilit sekä pieni mallisto myös vauvantarvikkeita.',NULL,'2020-04-28 00:38:21'),(47,'Magneettituotteet',6,'Molentum Oy','https://magneettituotteet.fi/','Magneetit vaikuttavat luonnollisella voimalla.',1,'2020-04-28 00:38:57'),(48,'Findogs',29,'Findogs Ay','https://www.findogs.fi/','Koiratarvikkeet vuosien ammattitaidolla nopeasti ja edullisesti!',7,'2020-04-28 00:40:59'),(49,'Maasta Ceramics',30,'Maasta Ceramics','http://maastaceramics.com/verkkokauppa/','Käsintehtyä kestävää käyttökeramiikkaa.',2,'2020-04-28 00:42:46'),(50,'Sampsukka',6,'Sampsukka','https://www.sampsukka.com/','Suomalainen vaatemerkki ja suunnittelemme hauskaa muotia lasten- ja naistenvaatteisiin. Sampsukan vaatteissa painottuu iloisuus, mukavuus ja korkea laatu.',NULL,'2020-04-28 00:43:35'),(51,'OHTO Nordic Home',31,'OHTO Nordic Home Oy','https://www.ohtonordichome.com/fi/verkkokauppa','Valikoimamme koostuu tarkoin valituista sisustus - ja lifestyletuotteista sekä huonekaluista skandinaaviseen makuun.',NULL,'2020-04-28 00:45:36'),(52,'Winnie Works',1,'Winnie Works Oy','https://www.winnieworks.fi/ewinnie','eWinnie on mielen ja kehon hyvinvoinnin etäpalvelu.',NULL,'2020-04-28 00:46:28'),(53,'Hello Honey',10,'Finhoney Oy','https://hellohoney.fi/fi/shop/','Maailman elämyksellisimmät kotimaiset lajihunajat suoraan mehiläistarhaajalta.',2,'2020-04-28 00:47:51'),(54,'PeliMuruset',32,'MediaMuruset Oy','https://www.pelimuruset.fi/','Retropelaajan pelikauppa - Myymme ja ostamme käytettyjä video- ja lautapelejä, klassisesta retrosta nykypäivän hitteihin. Katso tarjontamme!',8,'2020-04-28 00:50:07'),(55,'Teippikauppa',31,'','http://www.teippikauppa.fi/','Sisustustarroista opasteisiin. Mitä ikinä teipistä tarvitkaan, se löytyy meiltä!',NULL,'2020-04-28 00:51:30'),(56,'Leluaitta',33,'Leluaitta Oy','https://leluaitta.fi/','Kasvava valikoima leluja, klassikoista uutuusleluihin. Piipahda lelukauppaan Oulun myymälässämme tai tilaa kätevästi netistä!',3,'2020-04-28 00:52:40'),(57,'Muotitalo Lehtinen',34,'Muotitalo Lehtinen Oy','https://www.muotitalolehtinen.fi/','Olemme miesten ja naisten vaatteisiin ja laadukkaisiin premium-brändeihin keskittynyt verkkokauppa. Osta trendikkäät vaatteet kattavasta merkkivalikoimasta.',NULL,'2020-04-28 00:54:59'),(58,'Clean Pesulapalvelut',35,'Clean Pesulapalvelut Oy','https://cleanpesulapalvelut.fi/pesulapalvelut/','Verkkokaupassa voit ostaa pesupalveluitamme ja pestäville tuotteille nouto- ja palautuskuljetuksen.',2,'2020-04-28 00:58:03'),(59,'Adalmiinan Helmi',23,'Adalmiinan Helmi','http://kauppa.adalmiinanhelmi.fi/','Talonpoikaisantiikki-ja sisustusliike Adalmiinan Helmi syntyi vuonna 2004 wanhaan kivinavettaan, Turun kupeeseen, Paimioon.',NULL,'2020-04-28 00:59:11'),(60,'XXL-Dance',36,'PMP Wellness Oy','https://www.xxldancefinland.com/kauppa/','Verkkokaupastamme pääset ostamaan kätevästi niin verkkovalmennuksiamme, kuin myös tulevaisuudessa brändimme muita tuotteita.',2,'2020-04-28 01:02:30'),(61,'US Eagle',25,'US Eagle Oy','https://www.us-eagle.fi/','Varusteet turvallisuusalan ammattilaisille ja kaikille muille vapaa-aikaan luonnossa saat meiltä!',NULL,'2020-04-28 01:03:16'),(62,'Rekki',25,'Omnichannel Retail Services Oy','https://rekki.fi/','Laadukkaat käytetyt vaatteet, asusteet, kengät ja laukut verkkokaupasta naisille ja miehille. Voit myös myydä käytetyt tuotteesi meidän kautta.',2,'2020-04-28 01:07:01'),(63,'Digipalvelu Aura',28,'Digipalvelu Aura Oy','https://www.digiaura.fi/','Etätoimiston ja -koulun tarvikehankinnoissa auttaa DigiAura, josta myös digitoinnit sekä digihuolto ja -apu palvelut.',2,'2020-04-28 01:08:45'),(64,'Hippu Kids & Lifestyle',37,'Hippu Kids & Lifestyle Oy','https://www.hippukids.fi/','Vaatteita, asusteita, koruja, lastentarvikkeita, sisustusta, kortteja ym koko perheelle. Paljon kotimaisia tuotemerkkejä.',NULL,'2020-04-28 01:12:16'),(65,'HermoStory',1,'HermoStory','https://holvi.com/shop/hermostory/','Lahja- ja sarjakortit HermoStoryn hoitoihin. Terveempi Sinä kokonaisvaltaisilla hoidoilla.',9,'2020-04-28 01:11:46'),(66,'Lakipalvelut S.Jokinen',38,'Lakipalvelut S.Jokinen Oy','https://sjokinen.fi/kauppa/','Jyväskylässä toimiva lakiasiaintoimisto. Ositukset, avioehdot, perunkirjoitukset, edunvalvontavaltuutukset.',2,'2020-04-28 01:13:48'),(67,'Rockers',39,'','https://rockers.fi/','Suomalaisesta mustasta luonnonkivestä rouheita koruja ja asusteita rokkiasenteella!',3,'2020-04-28 01:15:47'),(68,'Luovia',1,'Nani Annette','https://holvi.com/shop/luovia/','Löydät välineet jouhevampaan työntekoon ja mainioon markkinointiin. Voit ostaa myös Nanin suosittuja verkkosparrauksia!',9,'2020-04-28 01:17:35'),(69,'Amalinda',40,'Amalinda Oy','https://www.amalinda.fi/kauppa/','Laadukasta luonnonkosmetiikkaa sekä lastenvaatteita.',2,'2020-04-28 01:18:58'),(70,'TaikaMama',10,'MeCasi Oy','https://www.taikamama.fi/verkkokauppa/','TaikaMamalta voi tilata pyykkietikat, imurointipuuterit, siivoussuihkeet ja kodin sisustus juttuja!',10,'2020-04-28 01:19:55'),(71,'Kotitavarakauppa',16,'Tmi Pasi Juntunen','https://www.kotitavarakauppa.fi/tuotteet.html','Kaikenlaista suomalaista tavaraa. Kenties jokaiselle vähän jotakin?',11,'2020-04-28 01:21:32'),(72,'Adaina',28,'Ada & Ina','https://www.adaina.fi/','Ada & Ina - laskosverhot ja verhot mittatilauksena, upeat verhokankaat, pellavakankaat ja verhoilukankaat.',NULL,'2020-04-28 01:27:23'),(73,'Elisa',1,'Elisa Oyj','https://elisa.fi/kauppa/','Elisalta saat edulliset Saunalahti-liittymät, puhelimet sekä Elisa Viihteen ja videovuokraamon. ',NULL,'2020-04-28 01:29:03'),(74,'DNA',1,'DNA Oyj','https://www.dna.fi/','Teemme arjesta inspiroivampaa, tuottavampaa ja viihdyttävämpää. Puhe- ja nettiliittymät sekä kattava valikoima laitteita.',NULL,'2020-04-28 01:30:03'),(75,'Kardis',41,'Sisustuskahvila kardemumma Ay','https://www.kardis.fi/','Shoppaile laadukkaat ja muodikkaat naisten vaatteet joko verkkokaupasta tai kivijalkamyymälästä. Paljon malleja ja eri kokoja, myös isoja kokoja.',NULL,'2020-04-28 01:36:11'),(76,'Kaari Lighters',28,'Action Group Finland Oy','https://kaarilighters.com/tuotteet/','Sähkökäyttöiset ja USB-ladattavat plasmasytyttimet. Myös logolaserointien kera. Fiksu ja kustannustehokas liikelahja!',2,'2020-04-28 01:37:44'),(77,'Rengastema',25,'Tmi BikeTema','https://www.rengastema.fi/','Auton ja moottoripyörän renkaat ja vanteet nopeasti ja luotettavasti kotiovellesi ilman toimituskuluja!',2,'2020-04-28 01:40:17'),(78,'Ecosto',22,'Koivuporras Oy','https://www.ecosto.fi/','Olemme suomalainen kodin-, vapaa-ajantuotteiden ja hyvinvoinnin verkkokauppa. Löydät meiltä ekologisia ja kestäviä tuotteita päivittäiseen käyttöösi.',NULL,'2020-04-28 01:41:51'),(79,'Aron soitin',1,'Soundstore Finland Oy','https://verkkokauppa.aronsoitin.fi/','Helsingin Herttoniemessä ja Vantaan Pakkalassa toimiva musiikkiliike, joka on toiminut soittimien jälleenmyyjänä jo vuodesta 1953.',3,'2020-04-28 01:43:40'),(80,'Saunataiga',42,'Saunataiga','https://www.saunataiga.fi/','Saunataiga suunnittelee ja valmistaa suomalaisia design saunatuotteita saunan valaistukseen ja sisustukseen. Päätuotteita saunavalaisin ja saunamittari.',8,'2020-04-28 01:45:13'),(81,'Wellbeing365',43,'Wellbeing365 Oy','https://wellbeing365oy.myshopify.com/','Tuotteita ja palveluita sisäiseen ja ulkoiseen hyvinvointiin.',3,'2020-04-28 01:49:05'),(82,'Sarin puoti',44,'Monialapalvelu Kajova Tmi','https://www.sarinpuoti.fi/','Kotimaisia ja tanskalaisia naistenvaatteita.',12,'2020-04-28 01:51:13'),(83,'Leikkikauppa',45,'Moda Kids Ab Oy','https://www.leikkikauppa.fi/','Kaupan hyllyiltä ja nettikaupasta löytyy toinen toistaan ihanampia leikkikaluja, lastenhuoneen sisustustavaroita kuin myös lasten- ja vauvanvaatteita',4,'2020-04-28 01:53:38'),(84,'Govindam',1,'Govindam Oy','https://www.govindam.fi/','Krishna-liikkeen jäsenten yritys, joka keskittyy temppelin puodissa ja verkkokaupassa olevien tavaroiden ja kirjojen myyntiin sekä pitopalvelutoimintaan.',2,'2020-04-28 01:55:09'),(85,'Scemosystemes',4,'Scemo Oy','http://scemosystems.fi/','Kaikenlaisia teknisiä kamppeita mistä voi rakennella laitteita tai kunnossapitää jotakin käytössä olevia laitteita.',13,'2020-04-28 01:56:07'),(86,'Pubu',32,'Ompelimo Eerika','https://pubu.fi/','Laadukkaat kotimaiset lastenvaatteet & värikkäät iloiset kuosit! Ompelemme kaikki verkkokaupan tuotteet Lohjalla pienessä ompelimossamme. Tutustu & ihastu!',2,'2020-04-28 01:56:25'),(87,'LMJ Kauppa',28,'','https://lmj.popice.fi/','Sydäntä lähellä ovat luonnonmukaisuus ja hyvinvointi, josta lähtikin ajatus myydä ecologisia pyykkietikoita ja kodintuotteita.',2,'2020-04-28 21:14:25'),(88,'Liaton pesula-automaatti',46,'Liaton Oy','https://www.pesula-automaatti.fi/','Helpoin tapa pesettää pyykkisi. Pesula on siellä missä sinäkin.',NULL,'2020-04-30 00:05:53'),(89,'Polku.guru',47,'Hubik Oy','https://kauppa.polku.guru/','Vuokraamme ja myymme polkupyöriä sekä järjestämme opastettuja pyörälenkkejä ja -retkiä Keurusselän alueella.',NULL,'2020-04-30 00:10:01'),(90,'Trinno',25,'Trinno Oy','https://trinno.fi/','Suomen innovatiivisin koulutusten digitalisoija. Sähköistämme useita ammattia pätevöittäviä ja työllisyyttä tukevia koulutuksia.',2,'2020-04-30 00:31:43'),(91,'Urheiluvälineiden verkkokauppa',33,'Oy SL-Goods Ab','https://www.urheilukauppa.eu/','Laadukkaita tuotteita eri palloilulajeihin, ja muuhunkin kuntoiluun ja liikkumiseen. Tuotemerkkejämme mm. Penalty, Pires, Poker, ExitToys, Stanno ja Givova.',NULL,'2020-05-08 23:42:47'),(92,'INB design',33,'INB design','https://holvi.com/shop/INBdesign/','Suunnittelemme ja valmistamme kaikki koruja itse. Ideoita saamme eri kulttuureista ja luonnosta.',9,'2020-05-09 08:01:12'),(93,'Team Laine',48,'Team Laine','https://shop.teamlaine.fi/','Tarvikkeet vauhdikkaaseen vapaa-aikaan.',NULL,'2020-05-09 08:28:17'),(94,'PhotoStella',25,'PhotoStella Oy','https://www.photostella.fi/','Pikakuvaukseen keskittynyt fotoerikoiskauppa. Heti toimitukseen halutuimmat uudet pikakamerat sekä filmit ja tarvikkeet.',NULL,'2020-05-09 08:36:28'),(95,'Design Sinivuokko',NULL,'','https://holvi.com/shop/designsinivuokko/','SINIVUOKKO- korut ja asusteet ovat valmistettu ekologisesti ja eettisesti pääosin suomalaisesta poron nahkasta sekä kierrätysnahkasta.',9,'2020-05-09 08:44:27'),(96,'Kemin lemmikkitukku',17,'Donum Lahjakorit Netistä','https://www.keminlemmikkitukku.fi/','Tilaa kissojen, koirien ja jyrsijöiden ruoat ja tarvikkeet nopeasti ja helposti netistä.',8,'2020-05-09 08:47:36'),(97,'Hevoskoulutus',49,'MW Hevospalvelut','https://hevoskoulutus.fi/','Hevosalan verkkokursseja moniin erilaisiin tarpeisiin hevosalan harrastajille ja ammattilaisille. Tutkittua tietoa, klassista taitoa.',2,'2020-05-25 22:00:00'),(98,'Ranka',NULL,'','https://ranka.cc/collections','Ihmisen kehon inspiroima Ranka Clothing Fasciawear on rakennettu aktiivisen elämäntavan mahdollistamiseksi.',3,'2020-05-25 22:17:57'),(99,'YO ZEN',33,'YO ZEN Oy','https://www.yozendesign.com/','YO ZEN luo runollisuutta jokapäiväiseen elämään. Ajaton muotoilu tuo pisaran hauskuutta, ihmeellisyyttä ja keksimisen riemua arjen pieniin hetkiin.',NULL,'2020-05-27 08:29:37'),(100,'Kuvakehys',50,'Itä-Suomen Fototukku Oy','https://kuvakehys.fi/','Valmistamme valokuvakehyksiä, kuvapohjukkeita, kiitoskortteja, paspartuureja, paspiksia ja korttipohjia askarteluun. Laadukasta Suomalaista käsityötä.',1,'2020-06-06 10:02:09'),(101,'Pomppa',51,'Pomppa Oy','https://pomppa.fi/','Pompan tuotteissa yhdistyvät käytännöllisyys, toimivuus ja hyvä istuvuus. Tavoitteena on, että koira voi nauttia ulkoilusta joka säällä.',2,'2020-07-08 19:10:56'),(102,'HAVU',33,'Kellon Lume Oy','https://www.havuwatches.com/','HAVU -puukellot ovat sinulle, joka etsit tyyliä, asennetta ja käyttömukavuutta. Puukello on täydellinen valinta niin arkeen kuin juhlaan.',3,'2020-07-27 23:28:56'),(103,'HerSecret',52,'HerSecret.fi','https://www.hersecret.fi/','Upeita naisten vaatteita edullisesti Valikoimastamme löydät näyttävät vaatteet arkeen, upeat juhlavaatteet ja sensuellit asut kahdenkeskisiin hetkiin.',NULL,'2020-07-27 23:56:02'),(104,'Halti',1,'Halti Oy','https://www.halti.fi/','Vaatteita ulkoiluun, retkeilyyn, lasketteluun, maastohiihtoon, juoksemiseen ja vapaa-aikaan naisille ja miehille.',3,'2020-07-28 00:04:07'),(105,'e-ville.com',53,'e-ville.com distribution Oy','https://www.e-ville.com/fi/','Ei sikaa säkissä, vaan suomalaisten testaamia ja hyväksymiä tuotteita luotettavasti. Tuotteita älypuhelimista 3D-printtereihin ja fatbike-polkupyöriin.',NULL,'2020-07-29 21:10:10'),(106,'Ninja.fi',1,'Ninja Finland Oy','https://ninja.fi/','Ninja on kotimainen korujen ja asusteiden erikoistavara myymälä ja valmistaja. Yli 30 vuoden ajan Ninja on palvellut suomalaisia asiakkaita ympäri maata.',3,'2020-07-30 19:39:51'),(107,'Scandinavian Outdoor',28,'Scandinavian Outdoor Oy','https://scandinavianoutdoor.fi/','Puemme sinut päästä varpaisiin retkelle ja arkeen. Meiltä löydät tekniset kuorivaatteet ja rennot retkeily- ja reippailuasut lähiretkille.',NULL,'2020-07-31 21:52:21'),(108,'Pieni Saippuakauppa',54,'Typu Oy','https://pienisaippuakauppa.fi/','Käsintehdyt saippuat, luonnon saippuat ja luonnonmukaiset ihonhoitotuotteet. Vähennä kemikaalikuormaa siirtymällä luonnonmukaisiin tuotteisiin.',1,'2020-08-28 12:43:13'),(109,'Jalavilla',55,'Jalavilla','https://jalavilla.com/','Uniikit design-korut sekä vaatetuspalvelut ja sisustustekstiilit. Jalavilla tekee juhlan ja arjen.',1,'2021-03-03 23:21:46');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tag_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(50) NOT NULL,
  `tag_link` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_title` (`tag_title`),
  UNIQUE KEY `tag_link` (`tag_link`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Vaatteet, kengät ja asusteet','vaatteet-kengat-asusteet'),(2,'Hyvinvointi ja terveys','hyvinvointi'),(3,'Kauneus','kauneus'),(4,'Retkeily, metsästys ja kalastus','retkeily'),(5,'Markkinointi','markkinointi'),(6,'Julisteet ja tulostuspalvelut','julisteet-tulosteet'),(8,'Muuttotarvikkeet','muutot'),(9,'Vuokrauspalvelut','vuokraus'),(10,'Koulutukset ja palvelut','palvelut'),(11,'Lahjakortit','lahjakortit'),(12,'Sisustus','sisustus'),(14,'Tekstiilit','tekstiilit'),(16,'Korut','korut'),(23,'Ravinto','ravinto'),(24,'Urheilu','urheilu'),(26,'Harrastukset','harrastukset'),(27,'Lapset','lapset'),(28,'Lemmikit','lemmikit'),(31,'Koti ja puutarha','koti'),(33,'Musiikki','musiikki'),(37,'Kyltit ja opasteet','opasteet'),(38,'Leivonta','leivonta'),(39,'Juhlat ja kokoukset','juhlat'),(40,'Laukut, kassit ja lompakot','laukut'),(41,'Hevostarvikkeet','hevoset'),(42,'Taide ja kortit','taide'),(43,'Ajoneuvot ja varusteet','ajoneuvot'),(44,'Kirjat ja lehdet','kirjat'),(45,'Elektroniikka','elektroniikka'),(46,'Toimistotarvikkeet','toimisto'),(47,'Pelit ja figuurit','pelit'),(48,'Lahjaideat','lahjat'),(49,'Puukot ja työkalut','tyokalut'),(50,'Turvatuotteet','turvallisuus'),(51,'Puhelimet ja tabletit','mobiililaitteet'),(52,'Tietokoneet ja oheislaitteet','tietokoneet'),(53,'Kodinkoneet','kodinkoneet'),(54,'Valokuvaus','valokuvaus');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `userPass` char(255) NOT NULL DEFAULT '',
  `userName` char(50) NOT NULL DEFAULT '',
  `jit` char(20) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'$2y$10$.9yO.P5L94OjB.ttI.buVOgPI5SfJLTtp2nKlk08TSJ02GnDBipbS','timo','d272737f05a099e6','2022-02-03 10:19:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-20 22:28:24
