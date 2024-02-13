extends Node

#################################################### 
# DATA
#################################################### 
#sources :
#INSEE : https://www.insee.fr/fr/statistiques/5371231?sommaire=5371304#tableau-figure2_radio2
#World Values Survey : https://www.worldvaluessurvey.org/WVSOnline.jsp

var first_names : Array = [
	"Achille", "Adèle", "Adrien", "Agnès", "Alain", "Alexandre", "Alice", "Aline", "Alphonse", "Amélie",
	"Anatole", "André", "Angèle", "Antoine", "Ariane", "Armand", "Aurélie", "Baptiste", "Béatrice", "Benoît",
	"Bernard", "Bertrand", "Blanche", "Brigitte", "Camille", "Caroline", "Catherine", "Cécile", "Céleste", "Céline",
	"Charles", "Charlotte", "Christelle", "Christiane", "Christophe", "Clara", "Claude", "Claudine", "Clément", "Colette",
	"Colin", "Corinne", "Cyrille", "Daniel", "Danielle", "David", "Delphine", "Denis", "Diane", "Didier",
	"Dominique", "Edgar", "Édith", "Éléonore", "Éliane", "Élisabeth", "Élodie", "Émilie", "Emmanuel", "Étienne",
	"Fabien", "Fabienne", "Félix", "Fernand", "Florence", "Florian", "Françoise", "Frédéric", "Gabriel", "Geneviève",
	"Georges", "Gérard", "Gilbert", "Grégoire", "Guillaume", "Hélène", "Henri", "Hervé", "Hugo", "Inès",
	"Isabelle", "Jacqueline", "Jean", "Jeanne", "Jérôme", "Jessica", "Joachim", "Joséphine", "Julie", "Julien",
	"Justine", "Laurent", "Léa", "Léon", "Léonie", "Louis", "Luc", "Lucas", "Lucie", "Madeleine",
	"Magali", "Manon", "Marcel", "Margaux", "Marguerite", "Marie", "Marion", "Marcelle", "Martine", "Mathieu",
	"Mathilde", "Matthieu", "Maurice", "Maxime", "Mélanie", "Michel", "Michelle", "Monique", "Nathalie", "Nicolas",
	"Nicolette", "Olivier", "Pascal", "Pascale", "Patrice", "Patricia", "Patrick", "Paul", "Pauline", "Philippe",
	"Pierre", "Rémi", "René", "Renée", "Richard", "Robert", "Roland", "Romain", "Sabine", "Samuel",
	"Sébastien", "Serge", "Simone", "Sylvain", "Sylvie", "Thérèse", "Thomas", "Valérie", "Véronique", "Victor",
	"Vincent", "Virginie", "Xavier", "Yann", "Yves", "Zoé"
]

var last_names : Array = [
	"Adam", "Allard", "Arnaud", "Aubert", "Barbier", "Baron", "Benoît", "Berger", "Bernard", "Bertrand",
	"Blanc", "Blanchard", "Boyer", "Brun", "Caron", "Carpentier", "Carré", "Clement", "Colin", "Collet",
	"David", "Debray", "Delacroix", "Delannoy", "Delattre", "Denis", "Descamps", "Deschamps", "Deschênes", "Desjardins",
	"Dubois", "Dufour", "Dupont", "Durand", "Fabre", "Faure", "Fernandez", "Ferrand", "Fischer", "Fontaine",
	"Fournier", "Garcia", "Garnier", "Gauthier", "Gérard", "Girard", "Giraud", "Gomez", "Gonzalez", "Guérin",
	"Guillaume", "Hamon", "Henry", "Hubert", "Huet", "Jacquet", "Joly", "Lacroix", "Lambert", "Laroche",
	"Lefebvre", "Lefevre", "Lefort", "Legrand", "Lemoine", "Leroy", "Lopez", "Lucas", "Martin", "Martinez",
	"Mathieu", "Mercier", "Meunier", "Michel", "Millot", "Monnier", "Morel", "Morin", "Muller", "Naudin",
	"Nicolas", "Noël", "Olivier", "Perez", "Perrin", "Petit", "Philippe", "Pierre", "Poirier", "Renaud",
	"Rey", "Reynaud", "Rivière", "Roch", "Roger", "Rousseau", "Roy", "Sauvage", "Schmitt", "Simon",
	"Thomas", "Vidal", "Vincent", "Voirin", "Weber", "Weiss", "Wolf"
]

var agePyramid : Dictionary = {
	"Age" : [15,19,24,29,34,39,44,49,54,59,64,69,74,100],
	"ProbaCumul" : [17,23.3,29.1,34.6,40.5,46.7,53,59.1,65.7,72.2,78.4,84.1,89.5,100]
}

var jobStats : Dictionary = {
	"Farmer" : {
		"ProbaCumul Niveau de vie" : [16.7, 27.2, 36.5, 43.7, 50.3, 57.8, 64.3, 72.1, 82.4, 100.0],
		"RevenuParDecile" : [9140,13408,17676,21944,26212,30480,34748,39016,43284,47552,51820],
		"Part dans la population" : 4.2
	},
	"Executive" : {
		"ProbaCumul Niveau de vie" : [2.8,4.2,6.1,8.8,12.9,18.8,26.1,40.7,62.7,100],
		"RevenuParDecile" : [19710,24006,28302,32598,36894,41190,45486,49782,54078,58374,62670],
		"Part dans la population" : 10.4
	},
	"Intermediate occupation" : {
		"ProbaCumul Niveau de vie" : [4.1,7.9,13.6,21.3,31.1,42.9,58,73.9,89.5,100],
		"RevenuParDecile" : [15330,17770,20210,22650,25090,27530,29970,32410,34850,37290,39730],
		"Part dans la population" : 14.6
	},
	"Employee" : {
		"ProbaCumul Niveau de vie" : [8.6,18.7,30.4,43.8,56.9,69.2,79.7,89.1,96,100],
		"RevenuParDecile" : [11680,13662,15644,17626,19608,21590,23572,25554,27536,29518,31500],
		"Part dans la population" : 15.8
	},
	"Worker" : {
		"ProbaCumul Niveau de vie" : [10,21.4,34.1,46.4,59.1,71.8,83.6,92.4,98,100],
		"RevenuParDecile" : [11200,13017,14834,16651,18468,20285,22102,23919,25736,27553,29370],
		"Part dans la population" : 12.0
	},
	"Retired" : { #Source : https://drees.solidarites-sante.gouv.fr/sites/default/files/2021-05/Fiche%2009%20-%20Le%20niveau%20de%20vie%20des%20retrait%C3%A9s.pdf
		"ProbaCumul Niveau de vie" : [13,35,57,79,100],
		"RevenuParDecile" : [607.75*12,970*12,1390*12,1780*12,2240*12,3860*12],
		"Part dans la population" : 29.5
	},
	"Unemployed - under Unemployment benefit" : {#source : https://www.insee.fr/fr/statistiques/7456885?sommaire=7456956#tableau-figure2
		"ProbaCumul Niveau de vie" : [24.9,42,53.7,62.7,69.8,76.2,82,87.5,92.9,100],
		"RevenuParDecile" : [607.75*12,12000,12787,13573,14360,15147,15933,16720,17507,18293,19080],
		"Part dans la population" : 7.1 #Chiffre du chomage
	},
	"Unemployed - under Solidarity income benefit" : {#source : https://drees.solidarites-sante.gouv.fr/sites/default/files/2022-12/AAS22-Fiche%2033%20-%20Les%20b%C3%A9n%C3%A9ficiaires%20du%20revenu%20de%20solidarit%C3%A9%20active%20%28RSA%29.pdf
		"ProbaCumul Niveau de vie" : [100.0],
		"RevenuParDecile" : [607.75*12,607.75*12],
		"Part dans la population" : 6.0
	},
}
var jobList = jobStats.keys()

#################################################### 
# FUNCTIONS
#################################################### 

func createCitizen():
	var _name = pickName()
	var _age = pickAge()
	var _occupation = pickJob(_age)
	var _revenue = getRevenue(_occupation)
	
	var profile : Dictionary = {
		"Name" : _name,
		"Age" : _age,
		"Occupation" : _occupation,
		"Monthly income (€)" : int(_revenue/12)
	}
	return profile

func pickName():
	var myFirstName = first_names.pick_random()
	first_names.erase(myFirstName)
	var myLastName = last_names.pick_random()
	last_names.erase(myLastName)
	return myFirstName+" "+myLastName

func pickAge():
	var age = 0
	var dice = randf_range(agePyramid["ProbaCumul"][1],100.0)
	var i = 0
	var cont = true
	while cont :
		if dice < agePyramid["ProbaCumul"][i] : 
			age = randi_range(agePyramid["Age"][i-1],agePyramid["Age"][i])
			cont = false
		else : i += 1
	return age

func pickJob(myAge):
	var myJob : String
	if myAge > 65 : myJob = "Retired"
	else : 
		var p = 0.0
		var probabilityJob : Array = []
		var myJobList = jobList
		myJobList.erase("Retired")
		for j in jobList :
			p += jobStats[j]["Part dans la population"]
			probabilityJob.append(p)
		var dice = randf_range(0.0,probabilityJob[-1])
		var i = 0
		var cont = true
		while cont:
			if dice < probabilityJob[i]:
				myJob = myJobList[i]
				cont = false
			else : i+=1
	return myJob

func getRevenue(myOccupation):
	var dice = randf_range(0.0,100.0)
	var i = 0
	var cont = true
	var myRevenue : float
	while cont:
		if dice < jobStats[myOccupation]["ProbaCumul Niveau de vie"][i] :
			myRevenue = randf_range(jobStats[myOccupation]["RevenuParDecile"][i],jobStats[myOccupation]["RevenuParDecile"][i+1])
			cont = false
		else : i+=1
	return myRevenue
	
