Config = {}

-- Marker
Config.Marker = 23
Config.keymastercoords = vector3(170.6294708252, -1799.0465087891, (29.235868453979-0.99))
Config.color = {r = 255, g = 0, b = 0}
Config.rangeToInteract = 4

-- price
Config.price = 2000

-- Key
Config.Key = 51

-- Truc en haut de l'ecran lol
Config.beforeInteract = "~b~Appuyez sur ~INPUT_CONTEXT~ pour parler au ~y~Serrurier"

-- RageUI
Config.prefix = {}

Config.prefix.frst = {[true] = "> ", [false] = " "}
Config.prefix.frst1 = {[true] = "> ", [false] = " "}
Config.prefix.frst2 = {[true] = "> ", [false] = " "}
Config.prefix.toggle = false
Config.prefix.toggle1 = false
Config.prefix.toggle2 = false

Config.title = "Dream RolePlay"
Config.blanksubandtitle = "SERRURIER"

Config.desc1 = "Pour fabriquer un doublon"
Config.desc2 = "Pour jeter un doublon"
Config.desc3 = "Pour changer la serrure du véhicule"

Config.KeyHomeMenu = "Créer un doublon"
Config.KeyHomeMenuSub = "Pour :"
Config.confirmmoney = "Payer en liquide ~g~("..Config.price.." $)"
Config.confirmbank = "Payer par carte de crédit ~b~("..Config.price.." $)"

Config.DestroyKey = "Détruire un doublon"
Config.DestroyKeySub = "Détruire le double de :"
Config.sure = "Êtes-vous sur de vouloir supprimer le double : ["

Config.KeyChange = "Changer la serrure de votre véhicule"
Config.KeyChangeSub = "Changer la serrure de :"
Config.sureChange = "Êtes-vous sur de vouloir supprimer les doubles : ["

Config.oui = "Oui"
Config.non = "Non"
Config.cancel = "Annuler"
Config.noVehCopy = "~r~Vous n'avez pas de doublons !"

-- Blips
Config.blips = {
    title = "Serrurier", 
    color = 0, 
    id = 134,
    x = 170.6294708252, 
    y = -1799.0465087891, 
    z = 29.235868453979
}