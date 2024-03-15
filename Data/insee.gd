extends Node

#################################################### 
# DATA
#################################################### 
#sources :
#INSEE : https://www.insee.fr/fr/statistiques/5371231?sommaire=5371304#tableau-figure2_radio2
#World Values Survey : https://www.worldvaluessurvey.org/WVSOnline.jsp

var first_names_female : Array = [
	"Emma","Louise","Jade","Alice","Chloé","Lina","Mila","Léa","Manon","Rose","Anna","Inès","Camille","Lola","Ambre",
	"Léna","Zoé","Juliette","Julia","Lou","Sarah","Lucie","Mia","Jeanne","Romane","Agathe","Eva","Nina","Charlotte",
	"Inaya","Léonie","Sofia","Margaux","Louna","Clara","Luna","Maëlys","Olivia","Adèle","Lilou","Clémence","Lana",
	"Léana","Capucine","Elena","Victoria","Aya","Mathilde","Margot","Iris","Anaïs","Giulia","Alicia","Romy","Nour",
	"Elise","Théa","Victoire","Yasmine","Lya","Mya","Elsa","Charlie","Assia","Lise","Lily","Noémie","Emy","Lisa","Lyna",
	"Marie","Soline","Apolline","Alix","Gabrielle","Valentine","Louane","Candice","Pauline","Faustine","Héloïse",
	"Océane","Ines","Mélina","Maya","Thaïs","Roxane","Salomé","Lila","Maria","Constance","Célia","Sara","Livia","Zélie",
	"Lyana","Emmy","Alya","Elisa","Maryam","Eloïse","Myla","Manel","Laura","Amélia","Maëlle","Justine","Louisa","Elina",
	"Maïssa","Eléna","Selma","Kenza","Lison","Léane","Nora","Lena","Eden","Charline","Joséphine","Aliya","Hanna","Anaé",
	"Amina","Méline","Suzanne","Anaëlle","Garance","Ninon","Julie","Sophia","Ava","Andréa","Myriam","Albane","Amira",
	"Ana","Ilyana","Céleste","Calie","Aliyah","Lilia","Elya","Sirine","Diane","Emilie","Naëlle","Fatima","Jana","Marwa",
	"Asma","Assya","Jenna","Neyla","Stella","Coline","Eléonore","Cassandre","Aïcha","Sasha","Lylou","Tessa","Leïla",
	"Naïla","Lucy","Mélissa","Eline","Naomi","Emna","Élise","Layana","Clémentine","Ella","Khadija","Ellie","Lilya",
	"Milla","Leyna","Célestine","Salma","Sophie","Anouk","Maëva","Cléa","Aria","Lia","Jasmine","Naomie","Norah","Mayssa",
	"Lara","Lily-Rose","Eléa","Louison","Alyssa","Camélia","Augustine","Mariam","Soumaya","Dina","Tess","Alia","Alma",
	"Joy","Jennah","Elyne","Hanaé","Elia","Safiya","Elyna","Malak","Axelle","Hafsa","Arya","Cloé","Madeleine","Marion",
	"Fatoumata","Shanna","Lucile","Elif","Imane","Liya","Clarisse","Valentina","Morgane","Éléonore","Enora","Maïwenn",
	"Tasnim","Aminata","Judith","Nelya","Raphaëlle","Sana","Line","Aurore","Melina","Carla","Mélia","Éléna","Chiara",
	"Bérénice","Hana","Izia","Maëlya","Nayla","Anastasia","Rachel","Nélia","Liana","Alexia","Daphné","Maïa","Cassie",
	"Janna","Neïla","Anissa","Maxine","Hortense","Amélie","Talia","Miya","Farah","Lea","Amel","Naïa","Ayline","Eliana",
	"Safa","Assiya","Cassandra","Esther","Mina","Thalia","Yuna","Alessia","Malia","Noélie","Hawa","Shana","Maëly",
	"Selena","Lili","Maïna","Cataleya","Estelle","Maëline","Athénaïs","Flora","Olympe","Hannah","Ashley","Kiara",
	"Maëlyne","Paloma","Amandine","Kayla","Lexie","Melissa","Meryem","Naya","Cléo","Violette","Esma","Aaliyah","Amalia",
	"Chloe","Hajar","Maëlie","Yousra","Liv","Amy","Rania","Talya","Fanny","Marilou","Evy","Hind","Lylia","Rosalie",
	"Mellina","Serena","Jannah","Lyanna","Séléna","Éloïse","Éva","Aliénor","Ema","Solène","Wendy","Éléa","Alizée",
	"Maelys","Sixtine","Lilas","Syrine","Alexandra","Claire","Isra","June","Blanche","Angèle","Enola","Lucia",
	"Héléna","Kélya","Gabriella","Maëlia","Paola","Aline","Lyne","Maeva","Meriem","Zoe","Thelma","Laly","Safia",
	"Hidaya","Mona","Kelly","Leana","Johanna","Lyah","Mïa","Emilia","Leïa","Awa","Pia","Elyana","Mélyna","Alycia",
	"Diana","Juliana","Abby","Amelia","Tiana","Angelina","Shayna","Alba","Nawel","Léonore","Sélène","Flavie","Syana",
	"Alyah","Isaure","Chaïma","Ela","Joyce","Tasnime","Émilie","Carmen","Israa","Luce","Nélya","Eve","Mélodie","Noor",
	"Andrea","Elisabeth","Leila","Marylou","Maïssane","Noa","Kelya","Layna","Leïna","Maé","Dounia","Élina",
	"Philippine","Zahra","Anya","Lyla","Mayline","Séréna","Assil","Loane","Malya","Éline","Anaya","Kyara","Laurine",
	"Laïna","Maïlys","Soraya","Astrid","Eugénie","Halima","Iliana","Rita","Aylin","Lalie","Lindsay","Céline","Nada",
	"Ariane","Lahna","Lilly","Shaïna","Tina","Mélya","Loïs","Téa","Zaynab","Alana","Castille","Emmie","Noéline",
	"Abigaëlle","Annabelle","Ilona","Aicha","Irina","Ayana","Callie","Leyla","Fleur","Nelia","Sanaa","Zeynep","Brune",
	"Charlize","Helena","Tara","Tia","Amaya","Anais","Maddy","Lydia","Suzie","Élisa","Angela","Bertille","Hiba","Sakina",
	"Yaëlle","Camila","Maylis","Mélyne","Oriane","Azra","Bianca","Maud","Sibylle","Anaë","Gabriela","Milana","Sabrina",
	"April","Fanta","Mathilda","Sienna","Firdaws","Lyse","Rebecca","Annaëlle","Emie"
]
var first_names_male : Array = [
	"Gabriel","Louis","Raphaël","Jules","Adam","Lucas","Léo","Hugo","Arthur","Nathan","Liam","Ethan","Maël","Paul",
	"Tom","Sacha","Noah","Gabin","Nolan","Enzo","Mohamed","Aaron","Timéo","Théo","Mathis","Axel","Victor","Antoine",
	"Valentin","Martin","Noé","Eden","Robin","Marius","Rayan","Clément","Baptiste","Maxime","Samuel","Léon","Yanis",
	"Augustin","Eliott","Maxence","Evan","Mathéo","Alexandre","Thomas","Simon","Gaspard","Naël","Tiago","Amir",
	"Isaac","Nino","Ibrahim","Lyam","Lenny","Malo","Imran","Marceau","Alexis","Kaïs","Camille","Noa","Oscar","Noam",
	"Mathys","Esteban","Ayden","Ilyes","Lorenzo","Kylian","Adrien","Côme","Wassim","Ismaël","Soan","Amine","Youssef",
	"Milo","Naïm","Benjamin","Ayoub","Joseph","Owen","Ali","William","Jean","Louka","Adem","Bastien","Léandre",
	"Antonin","Logan","Noham","Kenzo","Younes","Sandro","David","Charles","Diego","Sohan","Rafael","Milan","Nahil",
	"Ruben","Charly","Julian","Pierre","Basile","Pablo","Issa","Elias","Timothée","Sasha","Rafaël","Thibault","Elio",
	"Malone","Hamza","Nassim","Anas","Mahé","Timothé","Lucien","Auguste","Thiago","Ewen","Abel","Mattéo","Yassine",
	"Loan","Zakaria","Alban","Aymen","Marcel","Quentin","Mehdi","Nathanaël","Ahmed","Mathias","Corentin","Nael",
	"Charlie","Alessio","Dylan","Marin","Achille","Luka","Raphael","Leo","Loris","Joshua","Tristan","Romain",
	"Léonard","Luca","Ryan","Nicolas","Ezio","Erwan","Ilan","Titouan","Andrea","Eliot","Daniel","Armand","Amaury",
	"Ilyas","Samy","Idriss","Hayden","Mael","Haroun","Lilian","Mohammed","Moussa","Roméo","Aylan","Ulysse","Mathieu",
	"Matéo","Imrane","Jonas","Lino","Mayron","Bilal","Livio","Iyad","Elliot","Johan","Alex","Gustave","Matteo",
	"Léandro","Emmanuel","Jayden","Mylan","Julien","Ilyan","Arsène","Maé","Anis","Emile","Ismaïl","Nolhan","Sofiane",
	"Omar","Leandro","Jordan","Tim","Gaël","Gauthier","Loïs","Rayane","Morgan","Léopold","Marley","Anatole","James",
	"Djibril","Tyméo","Sami","Lisandro","Yann","Félix","Marcus","Henri","Elie","Hector","Ismael","Yacine","Octave",
	"Souleymane","Edouard","Kamil","Warren","Tao","Lenzo","Luis","Issam","Kassim","César","Solal","Bryan","Naïl","Tony",
	"Emir","Anthony","Souleyman","Nahel","Iyed","Malik","Dorian","Marwan","Swann","Abdallah","Elyas","Téo","Gianni",
	"Matthieu","Ange","Lukas","Wyatt","Anton","Giulian","Edgar","Elijah","Leny","Ylan","Lohan","Gaston","Swan","Joachim",
	"Paolo","Salim","Jassim","Ernest","Roman","Angelo","Aubin","Fares","Justin","Nolann","Walid","Célestin","Ilhan",
	"Max","Timeo","Adel","Marc","Aloïs","Sam","Jad","Célian","Nils","Alix","Georges","Jason","Tino","Youcef","Tyler",
	"Wael","Louison","Jessim","Elouan","Loïc","Théodore","Tilio","Ismail","Mamadou","Bilel","Qassim","Zayd","Emilio",
	"Yusuf","Aurélien","Khalil","Matthew","Soren","Chahine","Alan","Elyo","Aksel","Marvin","Émile","Éthan","Aïden",
	"Eyden","Nelson","Andy","Aymeric","Cameron","Dimitri","Florian","Marlon","Theo","Clovis","Youssouf","Eymen","Lewis",
	"Ilyès","Kevin","Melvin","Zayn","Adrian","Camil","Fabio","Joris","Louca","Gaëtan","Manoé","Lény","Néo","Kyllian",
	"Mateo","Thibaut","Vadim","Thiméo","Vincent","Ziyad","Evann","Hippolyte","Zack","Aron","Etienne","Hadrien","Enes",
	"Matthias","Ishaq","Soulayman","Aydan","Loup","Lubin","Zakariya","Nathaël","Stan","Guillaume","Jonathan","Tylio",
	"Zacharie","Éden","Abdoulaye","Ilian","Pharell","Rémi","Ugo","Waël","Yasser","Adil","Damien","Milhan","Angel",
	"Estéban","Grégoire","Wesley","Stanislas","Ezra","Mohamed-Amine","Riyad","Lou","Élie","Ousmane","Miguel","Jacques",
	"Calvin","Marco","Giovanni","Leon","Loucas","Lyham","Nohan","Yassin","Kais","Milàn","Aiden","Joan","Luc","Andréa",
	"Armel","Idris","Karim","Karl","Matis","Maximilien","Siméon","Yaël","Kelyan","Tobias","Haron","Soën","Yahya","Elyes",
	"Mylann","Jaden","Younès","Mouhamed","Muhammed","Manoa","Aedan","Ambroise","Ayman","Loukas","Thyméo","Ylann","Ishak",
	"Albin","Ewenn","Clement","Ibrahima","Liham","Matys","Théophile","Noe","Olivier","Colin","Yohan","Mickaël","Muhammad",
	"Ryad","Selim","Alessandro","Flavio","Mahdi","Kévin","Ivan","Joud","Jérémy","Zakarya","Aurèle","Farès","Islem",
	"Yannis","Élio","Andrew","Chris","Ewan","Jibril","Maëlan","Melvyn","Antonio","Elliott","Oumar","Allan","Amjad",
	"Matheo","Ziad","Harry","Paulin","Kyle","Carl","Lissandro","Paco","Tayron","Jimmy","Aboubacar","Akram","Anes","Hassan"
]

var last_names : Array = [
	"Martin","Bernard","Robert","Richard","Durand","Dubois","Moreau","Simon","Laurent","Michel","Garcia","Thomas",
	"Leroy","David","Morel","Roux","Girard","Fournier","Lambert","Lefebvre","Mercier","Blanc","Dupont","Faure",
	"Bertrand","Morin","Garnier","Nicolas","Marie","Rousseau","Bonnet","Vincent","Henry","Masson","Robin",
	"Martinez","Boyer","Muller","Chevalier","Denis","Meyer","Blanchard","Lemaire","Dufour","Gauthier","Vidal",
	"Perez","Perrin","Fontaine","Joly","Jean","da Silva","Gautier","Roche","Roy","Pereira","Mathieu","Roussel",
	"Duval","Guerin","Lopez","Rodriguez","Colin","Aubert","Lefevre","Marchand","Schmitt","Picard","Caron","Sanchez",
	"Meunier","Gaillard","Louis","Nguyen","Lucas","Dumont","dos Santos","Brunet","Clement","Brun","Arnaud","Giraud",
	"Barbier","Rolland","Charles","Hubert","Fernandes","Fabre","Moulin","Leroux","Dupuis","Guillaume","Roger","Paris",
	"Guillot","Dupuy","Fernandez","Carpentier","Payet","Ferreira","Olivier","Philippe","Deschamps","Lacroix","Jacquet",
	"Rey","Klein","Renaud","Baron","Leclerc","Royer","Berger","Bourgeois","Bertin","Petit","Adam","Daniel","Lemoine",
	"Pierre","Francois","Goncalves","Benoit","Lecomte","Vasseur","Lebrun","Leblanc","Leclercq","Besson","Charpentier",
	"Etienne","Jacob","Michaud","Maillard","Dumas","Monnier","Fleury","Aubry","Hamon","Renard","Chevallier","Guyot",
	"Marty","Gomez","Gillet","Andre","Le Roux","Boucher","Bailly","Pons","Renault","Julien","Huet","Riviere","Gonzalez",
	"Reynaud","Collet","Bouvier","Millet","Rodrigues","Gerard","Bouchet","Schneider","Germain","Marchal","Martins",
	"Breton","Cousin","Langlois","Perrot","Perrier","Le Gall","Noel","Pelletier","Mallet","Weber","Hoarau","Chauvin",
	"Le Goff","Grondin","Antoine","Boulanger","Gilbert","Humbert","Guichard","Poulain","Collin","Tessier","Pasquier",
	"Jacques","Lamy","da Costa","Alexandre","Perret","Poirier","Pascal","Gros","Buisson","Albert","Lopes","Ruiz",
	"Lejeune","Cordier","Hernandez","Georges","Maillot","Delaunay","Laporte","Pichon","Voisin","Lemaitre","Launay",
	"Lesage","Carlier","Ollivier","Gomes","Besnard","Camus","Coulon","Cohen","Charrier","Paul","Didier","Guillet",
	"Guillou","Remy","Joubert","Bousquet","Verdier","Hoareau","Briand","Raynaud","Delmas","Coste","Blanchet","Marin",
	"Lebreton","Leduc","Sauvage","Martel","Gaudin","Lebon","Rossi","Diallo","Delattre","Maury","Ribeiro","Bigot",
	"Menard","Guillon","Thibault","Colas","Raymond","Delorme","Pineau","Joseph","Hardy","Berthelot","Allard","Lagarde",
	"Ferrand","Valentin","Lenoir","Tran","Bonneau","Clerc","Godard","Tanguy","Brunel","Gilles","Imbert","Seguin",
	"Jourdan","Alves","Bruneau","Bodin","Morvan","Vaillant","Marion","Devaux","Maurice","Courtois","Baudry","Chauvet",
	"Prevost","Couturier","Turpin","Lefort","Lacombe","Favre","Maire","Barre","Riou","Allain","Lombard","Mary","Lacoste",
	"Blin","Costa","Evrard","Thierry","Leveque","Loiseau","Navarro","Laroche","Bourdon","Texier","Carre","Levy",
	"Toussaint","Grenier","Guilbert","Guibert","Chartier","Bonnin","Maillet","Benard","Jacquot","Auger","Vallet",
	"Leconte","Bazin","Rousset","Fischer","Rocher","Normand","Descamps","Potier","Valette","Peltier","Duhamel",
	"Wagner","Merle","Faivre","Barbe","Blondel","Pottier","Pinto","Maurin","Guyon","Vial","Martineau","Blot","Gallet",
	"Foucher","Delage","Guy","Chauveau","Barthelemy","Fouquet","Boutin","Bouvet","Salmon","Rossignol","Neveu",
	"Lemonnier","Marechal","Herve","Delahaye","Poncet","Bernier","Lafon","Teixeira","Chapuis","Pujol","Lecoq",
	"Charbonnier","de Sousa","Laborde","Cros","Serre","Andrieu","Girault","Pruvost","Berthier","Grand","Sabatier",
	"Boulay","Le Roy","Duclos","Martinet","Hebert","Maurel","Gervais","Dias","de Oliveira","Parent","Jourdain","Ali",
	"Regnier","Marc","Diaz","Billard","Favier","Bellanger","Delannoy","Torres","Dubreuil","Becker","Doucet","Gras",
	"Prigent","Rigaud","Samson","Masse","Cornu","Chambon","Mas","Fortin","Besse","Castel","Letellier","Ricard",
	"Benoist","Poisson","Parmentier","Lepage","Boulet","Grandjean","Claude","Mendes","Bonhomme","Roques","Huguet",
	"Comte","Pommier","Le Corre","Forestier","Drouet","Constant","Leblond","Jolly","Brault","Gosselin","Lacour","Rose",
	"Prat","Geoffroy","Hamel","Tournier","Rault","Mounier","Ledoux","Marquet","Blondeau","Grange","Morand","Picot",
	"Millot","Brossard","Laval","Merlin","Bocquet","Granger","Jung","Leleu","Levasseur","Guillemin","Armand","Barret",
	"Mouton","Champion","Moreno","Bouquet","Keller","Bourdin","Cartier","Gimenez","Jamet","Lavigne","Combes","Said",
	"Lelievre","Guillard","Berthet","Guillemot","Gibert","Leray","Gicquel","Ferry","Fort","Dumoulin","Provost","Basset",
	"Papin","Terrier","Walter","Andrieux","Tellier","Jeanne","Bataille","Munoz","Jullien","Ramos","Prieur","Bouchard",
	"Saunier","Bon","Chatelain","Foulon","Lasserre"
]

var agePyramid : Dictionary = {
	"Age" : [15,19,24,29,34,39,44,49,54,59,64,69,74,100],
	"ProbaCumul" : [17,23.3,29.1,34.6,40.5,46.7,53,59.1,65.7,72.2,78.4,84.1,89.5,100]
}

var jobStats : Dictionary = {
	"Farmer" : {
		"ProbaCumul Niveau de vie" : [0.0,16.7, 27.2, 36.5, 43.7, 50.3, 57.8, 64.3, 72.1, 82.4, 100.0],
		"RevenuParDecile" : [9140,13408,17676,21944,26212,30480,34748,39016,43284,47552,51820],
		"Part dans la population" : 4.2
	},
	"Executive" : {
		"ProbaCumul Niveau de vie" : [0.0,2.8,4.2,6.1,8.8,12.9,18.8,26.1,40.7,62.7,100],
		"RevenuParDecile" : [19710,24006,28302,32598,36894,41190,45486,49782,54078,58374,62670],
		"Part dans la population" : 10.4
	},
	"Intermediate occupation" : {
		"ProbaCumul Niveau de vie" : [0.0,4.1,7.9,13.6,21.3,31.1,42.9,58,73.9,89.5,100],
		"RevenuParDecile" : [15330,17770,20210,22650,25090,27530,29970,32410,34850,37290,39730],
		"Part dans la population" : 14.6
	},
	"Employee" : {
		"ProbaCumul Niveau de vie" : [0.0,8.6,18.7,30.4,43.8,56.9,69.2,79.7,89.1,96,100],
		"RevenuParDecile" : [11680,13662,15644,17626,19608,21590,23572,25554,27536,29518,31500],
		"Part dans la population" : 15.8
	},
	"Worker" : {
		"ProbaCumul Niveau de vie" : [0.0,10,21.4,34.1,46.4,59.1,71.8,83.6,92.4,98,100],
		"RevenuParDecile" : [11200,13017,14834,16651,18468,20285,22102,23919,25736,27553,29370],
		"Part dans la population" : 12.0
	},
	"Retired" : { #Source : https://drees.solidarites-sante.gouv.fr/sites/default/files/2021-05/Fiche%2009%20-%20Le%20niveau%20de%20vie%20des%20retrait%C3%A9s.pdf
		"ProbaCumul Niveau de vie" : [0.0,13,35,57,79,100],
		"RevenuParDecile" : [607.75*12,970*12,1390*12,1780*12,2240*12,3860*12],
		"Part dans la population" : 29.5
	},
	"Unemployed - under Unemployment benefit" : {#source : https://www.insee.fr/fr/statistiques/7456885?sommaire=7456956#tableau-figure2
		"ProbaCumul Niveau de vie" : [2.0,4.9,42,53.7,62.7,69.8,76.2,82,87.5,92.9,100],
		"RevenuParDecile" : [607.75*12,12000,12787,13573,14360,15147,15933,16720,17507,18293,19080],
		"Part dans la population" : 7.1 #Chiffre du chomage
	},
	"Unemployed - under Solidarity income benefit" : {#source : https://drees.solidarites-sante.gouv.fr/sites/default/files/2022-12/AAS22-Fiche%2033%20-%20Les%20b%C3%A9n%C3%A9ficiaires%20du%20revenu%20de%20solidarit%C3%A9%20active%20%28RSA%29.pdf
		"ProbaCumul Niveau de vie" : [0.0,100.0],
		"RevenuParDecile" : [607.75*12,607.75*12],
		"Part dans la population" : 6.0
	},
}
var jobList = jobStats.keys()

var urbainRural : Dictionary = { #source : https://www.insee.fr/fr/statistiques/4806694#graphique-figure2
	"ProbaCumul Ville" : [0.0,19.5,39.2,57.6,81.2,93.4,100.0],
	"Type de Ville" : ["Paris","Metropolis","Big town","Small town","Village","Tiny village"]
}

var structureFamille : Dictionary = { #source https://www.insee.fr/fr/statistiques/4277630?sommaire=4318291
	"ProbaCumul situation" : [0.0,23.0,57.5,87.3,97.1,100.0],
	"Situation" : ["No children", "1 child", "2 children","3 children","4 children or more"]
}

var ecartSalarialHommeFemme = 0.24 #source : https://www.insee.fr/fr/statistiques/:~:text=En%20moyenne,%20le%20volume%20de,%C3%A9l%C3%A8ve%20%C3%A0%2015,5%20%.#tableau-figure1_radio1

var pourcentageImmigre = 10.3 #source : https://www.insee.fr/fr/statistiques/3633212
var country_list = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];

#################################################### 
# FUNCTIONS
#################################################### 

func createCitizen():
	var _gender = pickGender()
	var _name = pickName(_gender)
	var _age = pickAge()
	var _occupation = pickJob(_age)
	var _revenue = getRevenue(_occupation,_gender)
	var _habitation = getHabitation(_occupation)
	var _nbChildren = getNbChildren()
	var _country = getCountry()
	if _country != "France" : _revenue *= 0.9
	
	var profile : Dictionary = {
		"Gender" : _gender,
		"Name" : _name,
		"Age" : float(_age),
		"Occupation" : _occupation,
		"Monthly income (€)" : float(int(_revenue/12)),
		"Lives in" : _habitation,
		"Number of children" : _nbChildren,
		"Born in" : _country
	}
	return profile
	
#################################################### 

func rollDiceCumulProba(cumulProba,beg,end):
	var dice = randf_range(cumulProba[beg],cumulProba[end])
	var i = 0
	var cont = true
	while cont:
		if dice < cumulProba[i]:
			cont = false
		else : i+=1
	return i
	
#################################################### 

func pickGender():
	var dice = randf_range(0.0,100.)
	if dice<50. : return "Female"
	else : return "Male"
	
func pickName(myGender):
	var myFirstName
	if myGender == "Female":
		myFirstName = first_names_female.pick_random()
		first_names_female.erase(myFirstName)
	else :
		myFirstName = first_names_male.pick_random()
		first_names_male.erase(myFirstName)
	var myLastName = last_names.pick_random()
	last_names.erase(myLastName)
	return myFirstName+" "+myLastName

func pickAge():
	var i = rollDiceCumulProba(agePyramid["ProbaCumul"],1,-1)
	return int(randf_range(agePyramid["Age"][i-1],agePyramid["Age"][i]))

func pickJob(myAge):
	var myJob : String
	if myAge > 65 : myJob = "Retired"
	else : 
		var p = 0.0
		var probabilityJob : Array = [0.0]
		var myJobList = jobList
		myJobList.erase("Retired")
		for j in jobList :
			p += jobStats[j]["Part dans la population"]
			probabilityJob.append(p)
		var i = rollDiceCumulProba(probabilityJob,0,-1)
		myJob = myJobList[i-1]
	return myJob

func getRevenue(myOccupation,myGender):
	var i = rollDiceCumulProba(jobStats[myOccupation]["ProbaCumul Niveau de vie"],0,-1)
	var myRevenue = randf_range(jobStats[myOccupation]["RevenuParDecile"][i-1],jobStats[myOccupation]["RevenuParDecile"][i])
	if myGender == "Female" : return myRevenue*(1-ecartSalarialHommeFemme)
	else : return myRevenue

func getHabitation(myOccupation):
	if myOccupation == "Farmer" : return "Tiny village"
	else  : return urbainRural["Type de Ville"][rollDiceCumulProba(urbainRural["ProbaCumul Ville"],0,-1)-1]

func getNbChildren():
	return structureFamille["Situation"][rollDiceCumulProba(structureFamille["ProbaCumul situation"],0,-1)-1]

func getCountry():
	var dice = randf_range(0.0,100.0)
	if dice > pourcentageImmigre : return "France"
	else : return country_list.pick_random()
