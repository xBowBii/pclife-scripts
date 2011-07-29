//Config settings for JTD_FireAndSmoke.

//Fire and smoke enable - true = enable fire and smoke effects, false = disable fire and smoke
//(Also disables forest fires irrelevent of forest fire enable value)

#define _JTD_FireAndSmokeEnabled true


//Forest Fire enable - true = enable forest fires, false = disable forest fires

#define JTD_ForestFireEnabled false


//Forest fire maximum concurrent fires allowed.

#define JTD_MaxFires 50


//Fire colour adjust.
//Original yellow
//#define JTD_FireRed 1
//#define JTD_FireGreen 1
//#define JTD_FireBlue 1

//Mid-way orange
#define JTD_FireRed 1
#define JTD_FireGreen 0.5
#define JTD_FireBlue 0.5

//BIS orange
//#define JTD_FireRed 0.8
//#define JTD_FireGreen 0.3
//#define JTD_FireBlue 0.05


//Birds enable - true = enable birds, false = disable birds

#define JTD_BirdsEnable true


//Smoke_lifetime_Particle - The multiplier for particle lifetime, affects how long each particle hangs around.
//1 = default, less = shorter, more = longer. (1 = 100%, 0.5 = 50%, 2 = 200%)

#define JTD_Smoke_Lifetime_Particle 1



//Smoke_lifetime_Source - The multiplier for smoke source lifetime, affects how long vehicles burn.
//1 = default, less = shorter, more = longer. (1 = 100%, 0.5 = 50%, 2 = 200%)

#define JTD_Smoke_Lifetime_Source 1

//FuelFire_Probability - The probability that a smoke column source will also spawn a fuelfire.
//0.6 = default (60%), smaller = less probability, larger = more probability (up to 1). (1 = 100%, 0.5 = 50%, 0 = 0%)

#define JTD_FuelFire_Probability 0.6


#define JTD_DEFAULT_TREE_NAMES ["T_ACER2S.P3D","T_ALNUS2S.P3D","T_BETULA1F.P3D","T_BETULA2F.P3D","T_BETULA2S.P3D","T_BETULA2W.P3D","T_CARPINUS2S.P3D","T_FAGUS2F.P3D","T_FAGUS2S.P3D","T_FAGUS2W.P3D","T_FRAXINUS2S.P3D","T_FRAXINUS2W.P3D","T_LARIX3F.P3D","T_LARIX3S.P3D","T_MALUS1S.P3D","T_PICEA1S.P3D","T_PICEA2S.P3D","T_PICEA3F.P3D","T_PINUSN1S.P3D","T_PINUSN2S.P3D","T_PINUSS2F.P3D","T_POPULUS3S.P3D","T_PYRUS2S.P3D","T_QUERCUS2F.P3D","T_QUERCUS3S.P3D","T_SALIX2S.P3D","T_SORBUS2S.P3D","T_STUB_PICEA.P3D","DD_BOROVICE.P3D","DD_BOROVICE02.P3D","DD_BUSH01.P3D","DD_BUSH02.P3D","HRUSEN2.P3D","JABLON.P3D","KER BUXUS.P3D","KER DERAVEJ.P3D","KER PICHLAVEJ.P3D","KROVI.P3D","KROVI2.P3D","KROVI4.P3D","KROVI_BIGEST.P3D","KROVI_LONG.P3D","LES_BUK.P3D","LES_DUB.P3D","LES_DUB_JINY.P3D","LES_FIKOVNIK2.P3D","LES_SINGLESTROM.P3D","LES_SINGLESTROM_B.P3D","OLIVIA.P3D","PALMTEST.P3D","PALM_01.P3D","PALM_02.P3D","PALM_03.P3D","PALM_04.P3D","PALM_09.P3D","PALM_10.P3D","SMRK_SIROKY.P3D","SMRK_VELKY.P3D","STR BRIZA.P3D","STR BUK.P3D","STR DUB JINY.P3D","STR DUB.P3D","STR HABR.P3D","STR JAVOR.P3D","STR JERABINA.P3D","STR KASTAN.P3D","STR KROVISKO VYSOKE.P3D","STR LIPA.P3D","STR OSIKA.P3D","STR TRNKA.P3D","STR VRBA.P3D","STR_BRIZA_KRIVA.P3D","STR_BRIZA_ROVNA.P3D","STR_FIKOVNIK.P3D","STR_FIKOVNIK2.P3D","STR_FIKOVNIK_KER.P3D","STR_LISKAC.P3D","STR_PINIE.P3D","STR_TOPOL.P3D","STR_TOPOL2.P3D","BRG_AFRICANBOXWOOD_1.P3D","BRG_AFRICANBOXWOOD_2.P3D","BRG_AFRICANDOUMPALM_1.P3D","BRG_ALOE1.P3D","BRG_ALOE2.P3D","BRG_ALOE3.P3D","BRG_BAOBAB_1.P3D","BRG_BIRD_1.P3D","BRG_BIRD_2.P3D","BRG_BIRD_3.P3D","BRG_BOTTLE_1.P3D","BRG_BOTTLE_2.P3D","BRG_BOTTLE_3.P3D","BRG_BOTTLE_4.P3D","BRG_CARISSA_1.P3D","BRG_CARISSA_2.P3D","BRG_DATEPALM_1.P3D","BRG_DATEPALM_2.P3D","BRG_DATEPALM_3.P3D","BRG_DATEPALM_4.P3D","BRG_DEADSTUFF1.P3D","BRG_ELEGRASS_1.P3D","BRG_UMBRELLA_ACACIA01.P3D","BRG_UMBRELLA_ACACIA01B.P3D","BRG_UMBRELLA_ACACIA02.P3D","BRG_UMBRELLA_ACACIA02B.P3D","BRG_UMBRELLA_ACACIA03.P3D","BRG_UMBRELLA_ACACIA03B.P3D","BRG_UMBRELLA_ACACIA04.P3D","BRG_UMBRELLA_ACACIA04B.P3D","BRG_UMBRELLA_ACACIA_NEW01.P3D","BRG_UMBRELLA_ACACIA_SHRUB01.P3D","BRG_UMBRELLA_ACACIA_SHRUB02.P3D","BRG_UMBRELLA_ACACIA_SHRUB1.P3D","BRG_UMBRELLA_ACACIA_SHRUB2.P3D","T_AMYGDALUSC2S_EP1.P3D","T_FICUSB2S_EP1.P3D","T_JUNIPERUSC2S_EP1.P3D","T_PINUSE2S_EP1.P3D","T_PINUSS3S_EP1.P3D","T_PISTACIAL2S_EP1.P3D","T_POPULUSB2S_EP1.P3D","T_POPULUSF2S_EP1.P3D","T_PRUNUSS2S_EP1.P3D"]
