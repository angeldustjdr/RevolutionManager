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

var job : Dictionary = {
	"Agriculteur" : {
		"ProbaCumul Niveau de vie" : [16.7, 27.2, 36.5, 43.7, 50.3, 57.8, 64.3, 72.1, 82.4, 100.0],
		"RevenuParDecile" : [9140, 15125, 18117.5, 21110, 25210, 29310, 34488.3333, 39461.6667, 51820, 51820],
		"Part dans la population" : 4.2
	}
}


#################################################### 
# FUNCTIONS
#################################################### 

func pickName():
	var myFirstName = first_names.pick_random()
	first_names.remove_at(first_names.find(myFirstName))
	var myLastName = last_names.pick_random()
	last_names.remove_at(last_names.find(myLastName))
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
		else :
			i += 1
	return age
