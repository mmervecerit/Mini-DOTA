Object subclass: #Dota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

Dota subclass: #GameArena
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!GameArena methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:35'!
firstPlayerSkill1: anObject
	firstPlayerSkill1 := anObject! !

!GameArena methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:35'!
firstPlayerSkill2: anObject
	firstPlayerSkill2 := anObject! !

!GameArena methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:35'!
firstPlayerSkill2
	^ firstPlayerSkill2! !

!GameArena methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:35'!
secondPlayerSkill1: anObject
	secondPlayerSkill1 := anObject! !

!GameArena methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:35'!
secondPlayerSkill2: anObject
	secondPlayerSkill2 := anObject! !

!GameArena methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:35'!
secondPlayerSkill2
	^ secondPlayerSkill2! !

!GameArena methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:35'!
secondPlayerSkill1
	^ secondPlayerSkill1! !

!GameArena methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:35'!
firstPlayerSkill1
	^ firstPlayerSkill1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GameArena class
	instanceVariableNames: 'firstPlayerhealthpotions firstPlayermanapotions secondPlayerhealthpotions secondPlayermanapotions'!

!GameArena class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 17:27'!
actualdamage:attack with:armour

|tempresult tempresultrounded|

tempresult :=attack*(1-(0.06*armour)/(1+(0.06*armour))).
tempresultrounded :=  tempresult asInteger.
^tempresultrounded.! !

!GameArena class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:14'!
log:nameofhero withhp:hp withmaxhp:maxhp withmana:mana withmaxmana:maxmana withlastaction:action with:count withname2:nameofhero2 withhp2:hp2 withmaxhp2:maxhp2 withmana2:mana2 withmaxmana2:maxmana2 withlastaction2:action2
Transcript cr; show:'Player 1 Hero:'.
Transcript show:nameofhero.
Transcript cr;show:hp.
Transcript show:'/'.
Transcript show:maxhp.
Transcript show:' HP'.
Transcript cr;show:mana.
Transcript show:'/';show:maxmana.
Transcript show:' Mana'.
Transcript cr;show:'Last Action:'.
Transcript show:action.
GameArena healthpotion1: (GameArena firstPlayerhealthpotions) manapotion1: (GameArena firstPlayermanapotions).

Transcript cr; show:'Player 2 Hero:'.
Transcript show:nameofhero2.
Transcript cr;show:hp2.
Transcript show:'/'.
Transcript show:maxhp2.
Transcript show:' HP'.
Transcript cr;show:mana2.
Transcript show:'/';show:maxmana2.
Transcript show:' Mana'.
Transcript cr;show:'Last Action:'.
count=0
ifTrue:
[Transcript show:' No action yet.']
ifFalse:
[Transcript show:action2].
GameArena healthpotion2:(GameArena secondPlayerhealthpotions)  manapotion2:(GameArena secondPlayermanapotions). 

! !

!GameArena class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 21:50'!
firstplayerchoice:firstPlayer with:secondPlayer with:chosenItem with:firstPlayerSkill1 with:firstPlayerSkill2
|actualdamage|
chosenItem = 1 
ifTrue:[Transcript cr; show:'Player 1 attacks. '. actualdamage:= (GameArena actualdamage:(firstPlayer damage ) with:(secondPlayer armour)). secondPlayer hp: (secondPlayer hp - actualdamage).]
ifFalse:[chosenItem=2 
	ifTrue:[
		firstPlayer mana >= firstPlayerSkill1 manausage
		ifTrue:[
		Transcript cr; show:'Player 1 uses Skill1.'.
		firstPlayer mana: firstPlayer mana - firstPlayerSkill1 manausage. 
		secondPlayer hp:secondPlayer hp-100.]
		ifFalse:[Transcript cr;show:'You need more mana to use this skill.'].
		]
	ifFalse:[chosenItem=3 ifTrue:[
		firstPlayer mana >= firstPlayerSkill2 manausage
		ifTrue:[
		Transcript cr; show:'Player 1 uses Skill2.'.
		firstPlayer mana: firstPlayer mana - firstPlayerSkill2 manausage. 
		secondPlayer hp:secondPlayer hp-200.]
		ifFalse:[Transcript cr;show:'You need more mana to use this skill.'].
		]
	ifFalse:[chosenItem=4 ifTrue:[
			firstPlayerhealthpotions>0
			ifTrue:[Transcript cr; show:'Player 1 uses Health Potion. '.
			GameArena firstPlayerhealthpotions:GameArena firstPlayerhealthpotions-1.
			((firstPlayer hp+300)<=firstPlayer maxHp)
			 ifTrue: [firstPlayer hp: firstPlayer hp + 300.]
			ifFalse:[firstPlayer hp: firstPlayer maxHp.].]
			ifFalse:[Transcript cr;show:'You do not have health potion. Turn will be passed to the Player 2.'.].
			] 
		ifFalse:[
			firstPlayermanapotions>0
			ifTrue:[Transcript cr; show:'Player 1 uses Mana Potion. '.
			GameArena firstPlayermanapotions:GameArena firstPlayermanapotions-1.
			((firstPlayer mana + 300)<=firstPlayer maxMana)
			ifTrue: [firstPlayer mana: firstPlayer mana + 300. ]
			ifFalse:[firstPlayer mana:firstPlayer maxMana.].]
			ifFalse:[Transcript cr;show:'You do not have mana potion. Turn will be passed to the Player 2.'.].
			].].].].

! !

!GameArena class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 21:57'!
secondplayerchoice:secondPlayer with:firstPlayer with:chosenItem2 with:secondPlayerSkill1 with:secondPlayerSkill2
|actualdamage|
chosenItem2 = 1
ifTrue:[Transcript cr; show:'Player 2 attacks. '.actualdamage:= (GameArena actualdamage:(secondPlayer damage ) with:(firstPlayer armour)). firstPlayer hp: (firstPlayer hp - actualdamage).]
ifFalse:[chosenItem2=2 
	ifTrue:[
		secondPlayer mana >= secondPlayerSkill1 manausage
		ifTrue:[
		Transcript cr; show:'Player 2 uses Skill1.'.
		secondPlayer mana: secondPlayer mana - secondPlayerSkill1 manausage. 
		firstPlayer hp:firstPlayer hp-100.]
		ifFalse:[Transcript cr;show:'You need more mana to use this skill.'].
		]
	ifFalse:[chosenItem2=3 
		ifTrue:[
			secondPlayer mana >= secondPlayerSkill2 manausage
			ifTrue:[
				Transcript cr; show:'Player 2 uses Skill2.'.
				secondPlayer mana: secondPlayer mana - secondPlayerSkill2 manausage. 
				firstPlayer hp:firstPlayer hp-200.]
			ifFalse:[
				Transcript cr;show:'You need more mana to use this skill.'].
				]
	 	ifFalse:[
		chosenItem2=4
			ifTrue:[
			GameArena secondPlayerhealthpotions>0
			ifTrue:[Transcript cr; show:'Player 2 uses Health Potion. '.
			GameArena secondPlayerhealthpotions:GameArena secondPlayerhealthpotions-1.
			((secondPlayer hp+300)<=secondPlayer maxHp)
			 ifTrue: [secondPlayer hp: secondPlayer hp + 300.]
			ifFalse:[secondPlayer hp: secondPlayer maxHp.].
			] 
			ifFalse:[Transcript cr;show:'You do not have health potion. Turn will be passed to the Player 2.'.].]
		ifFalse:[
			GameArena secondPlayermanapotions>0
			ifTrue:[Transcript cr; show:'Player 2 uses Mana Potion. '.
			GameArena secondPlayermanapotions:GameArena secondPlayermanapotions-1.
			((secondPlayer mana + 300)<=secondPlayer maxMana)
			ifTrue: [secondPlayer mana: secondPlayer mana + 300.]
			ifFalse:[secondPlayer mana: secondPlayer maxMana.].]
			ifFalse:[Transcript cr;show:'You do not have mana potion.Turn will be passed to the Player 2.'.].
			].
		].
	].
].! !

!GameArena class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:11'!
healthpotion2:healthpotion2  manapotion2:manapotion2

Transcript cr;show:'Remaining Potions:'.
Transcript show:healthpotion2.
Transcript show:' Health, '.
Transcript show:manapotion2.
Transcript show:' Mana'.! !

!GameArena class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:11'!
healthpotion1:healthpotion1 manapotion1:manapotion1 

Transcript cr;show:'Remaining Potions:'.
Transcript show:healthpotion1.
Transcript show:' Health, '.
Transcript show:manapotion1.
Transcript show:' Mana'.
! !


!GameArena class methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:42'!
secondPlayermanapotions: anObject
	^ secondPlayermanapotions := anObject! !

!GameArena class methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:40'!
firstPlayermanapotions: anObject
	^ firstPlayermanapotions := anObject! !

!GameArena class methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:40'!
firstPlayerhealthpotions: anObject
	^ firstPlayerhealthpotions := anObject! !

!GameArena class methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 23:58'!
"Merve Cerit- 2012402015
Details of the skills and the items could not be implemented.Cooldown could not be implemented(I got errors while I am reporting cooldowns, because there was no time left I am submitting the version without cooldown.
It is assumed that Skill1 damages 100, and Skill2 damages 200 for each hero.
"
start

|scourgeList sentinelList itemList chosenItem chosenItem2 fpChoice spChoice firstPlayer 
secondPlayer firstPlayerGold maxitem optionlistfirst optionlistsecond count firstPlayerSkill1 firstPlayerSkill2 secondPlayerSkill1 secondPlayerSkill2|
firstPlayerGold :=11000.

maxitem:=4.

scourgeList := #('Skeleton King' 'Tidehunter' 'Nyx Assassin' 'Mortred' 'Lion' 'Leshrac').
sentinelList := #('Sven' 'Earthshaker' 'Mirana' 'Magina' 'Rylai' 'Ogre Magi').
itemList := #('BattleFury' 'Hood of Defiance' 'Vitality Booster' 'Energy Booster' 'Butterfly' 'Daedalus' 'Desolator' 'Vanguard' 'Heart of Tarrasque' 'Health Potion' 'Mana Potion').

Transcript clear;open.
fpChoice := UIManager default chooseFrom: scourgeList message: 'Choose a hero from Scourge list for Player 1'.
fpChoice = 1
ifTrue:[firstPlayer := SkeletonKing  createNewHeroInstance.firstPlayerSkill1:=WraithfireBlast createNewSkill.firstPlayerSkill2:=VampiricAura createNewSkill.]
ifFalse:[
	fpChoice=2
	ifTrue:[firstPlayer := Tidehunter createNewHeroInstance.firstPlayerSkill1:=AnchorSmash createNewSkill.firstPlayerSkill2:=Ravage createNewSkill.]
	ifFalse:[fpChoice=3 ifTrue:[firstPlayer := NyxAssassin createNewHeroInstance.firstPlayerSkill1:=Impale createNewSkill.firstPlayerSkill2:=ManaBurn createNewSkill.] ifFalse:[fpChoice=4 ifTrue:[firstPlayer := Mortred createNewHeroInstance.firstPlayerSkill1:=Blur createNewSkill.firstPlayerSkill2:=CoupdeGrace createNewSkill.] ifFalse:[fpChoice=5 ifTrue:[firstPlayer := Lion createNewHeroInstance.firstPlayerSkill1:=EarthSpike createNewSkill.firstPlayerSkill2:=FingerofDeath createNewSkill.] ifFalse:[firstPlayer := Leshrac createNewHeroInstance.firstPlayerSkill1:=SplitEarth createNewSkill.firstPlayerSkill2:=PulseNova createNewSkill.].].].   ].].

spChoice := UIManager default chooseFrom: sentinelList message: 'Choose a hero from Sentinel list for Player 2'.
spChoice = 1
ifTrue:[secondPlayer := Sven createNewHeroInstance.secondPlayerSkill1:=StormHammer createNewSkill.secondPlayerSkill2:=GodsStrength createNewSkill.]
ifFalse:[
	fpChoice=2
	ifTrue:[secondPlayer := Earthshaker createNewHeroInstance.secondPlayerSkill1:=Fissure createNewSkill.secondPlayerSkill2:=EnchantTotem createNewSkill.]
	ifFalse:[fpChoice=3 ifTrue:[secondPlayer := Mirana createNewHeroInstance.secondPlayerSkill1:=Starstorm createNewSkill.secondPlayerSkill2:=SacredArrow createNewSkill.] ifFalse:[fpChoice=4 ifTrue:[secondPlayer := Magina createNewHeroInstance.secondPlayerSkill1:=ManaBreak createNewSkill.secondPlayerSkill2:=ManaVoid createNewSkill.] ifFalse:[fpChoice=5 ifTrue:[secondPlayer := Rylai createNewHeroInstance.secondPlayerSkill1:=Frostbite createNewSkill.secondPlayerSkill2:=FreezingField createNewSkill.] ifFalse:[secondPlayer := OgreMagi createNewHeroInstance.secondPlayerSkill1:=Fireblast createNewSkill.secondPlayerSkill2:=Multicast createNewSkill.].].].   ].].


GameArena firstPlayerhealthpotions:0.
GameArena firstPlayermanapotions:0.
GameArena secondPlayermanapotions:0.
GameArena secondPlayerhealthpotions:0. 
optionlistfirst := { 'Attack ' . firstPlayer skill1 asString .firstPlayer skill2 asString . 'Use Health Potion ' . 'Use Mana Potion '}.
optionlistsecond:= {'Attack ' . secondPlayer skill1 asString . secondPlayer skill2 asString . 'Use Health Potion ' .'Use Mana Potion '}.


[(firstPlayerGold > 199) & (maxitem > 0.1)]
whileTrue:[
chosenItem := UIManager default chooseFrom: itemList message: 'Choose an Item for Player 1. Remaining Gold: ',firstPlayerGold asString,' Remaining Item Slots: ',maxitem asString, '.'.
chosenItem = 1
ifTrue: [
	maxitem>0.9
	ifTrue:[firstPlayerGold >= 4500
	ifTrue:[
	firstPlayer itemList: (firstPlayer itemList) with:(BattleFury  createNewItem). firstPlayerGold := firstPlayerGold -4500. maxitem := maxitem-1.]
	ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
	ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
	] 
ifFalse: [ chosenItem =2 
	ifTrue:[
		maxitem>0.9
		ifTrue:[firstPlayerGold >=2000
		ifTrue:[firstPlayer itemList: firstPlayer itemList with:(HoodofDefiance createNewItem). firstPlayerGold := firstPlayerGold -2000. maxitem := maxitem-1.]
		ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.]. ]
		ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
		] 
ifFalse:[chosenItem =3 
	ifTrue:[
		maxitem>0.9
		ifTrue:[firstPlayerGold >=1200
		ifTrue:[firstPlayer itemList: firstPlayer itemList with:(VitalityBooster createNewItem). firstPlayerGold := firstPlayerGold -1200. maxitem := maxitem-1.]
		ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.]. ]
		ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
		] 
	ifFalse:[chosenItem=4 
	ifTrue:[
		maxitem>0.9
		ifTrue:[	firstPlayerGold >=1100
		ifTrue:[firstPlayer itemList: firstPlayer itemList with:(EnergyBooster createNewItem). firstPlayerGold := firstPlayerGold-1100. maxitem := maxitem-1.]
		ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.]. ]
		ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.]

		]
	ifFalse:[chosenItem=5 
		ifTrue:[
			maxitem>0.9
			ifTrue:[firstPlayerGold >=5500
			ifTrue:[firstPlayer itemList: firstPlayer itemList with:(Butterfly createNewItem). firstPlayerGold := firstPlayerGold-5500. maxitem := maxitem-1.]
			ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
			ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
			]
		ifFalse:[chosenItem=6 
			ifTrue:[
			maxitem>0.9
			ifTrue:[firstPlayerGold >=5500
			ifTrue:[firstPlayer itemList: firstPlayer itemList with:(Daedalus createNewItem). firstPlayerGold := firstPlayerGold-5500. maxitem := maxitem-1.]
			ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
			ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
			] 
			ifFalse:[chosenItem=7 
			ifTrue:[
				maxitem>0.9
				ifTrue:[firstPlayerGold >=4000
				ifTrue:[firstPlayer itemList: firstPlayer itemList with:(Desolator createNewItem). firstPlayerGold := firstPlayerGold-4000. maxitem := maxitem-1.]
				ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
				ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
				] 
			ifFalse:[chosenItem=8
				ifTrue:[
					maxitem>0.9 
					ifTrue:[
						firstPlayerGold >=2500
						ifTrue:[firstPlayer itemList: firstPlayer itemList with:(Vanguard createNewItem). firstPlayerGold := firstPlayerGold-2500. maxitem := maxitem-1.]
						ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].
						]
					ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
				] 
				ifFalse:[chosenItem=9 
					ifTrue:[
						maxitem>0.9
						ifTrue:[firstPlayerGold >=5600
						ifTrue:[firstPlayer itemList: firstPlayer itemList with:(HeartofTarrasque createNewItem). firstPlayerGold := firstPlayerGold-5600. maxitem := maxitem-1.]
						ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
						ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
						] 
					ifFalse:[chosenItem=10
						 ifTrue:[
							firstPlayerGold >=200
							ifTrue:[firstPlayer itemList: firstPlayer itemList with:(HealthPotion createNewItem). firstPlayerGold := firstPlayerGold-200. maxitem := maxitem-0.5. GameArena firstPlayerhealthpotions:GameArena firstPlayerhealthpotions+1.]
							ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].
							] 
						ifFalse:[
							firstPlayerGold >=200
							ifTrue:[firstPlayer itemList: firstPlayer itemList with:(ManaPotion createNewItem). firstPlayerGold := firstPlayerGold-200. maxitem := maxitem-0.5. GameArena firstPlayermanapotions:GameArena firstPlayermanapotions+1.]
							ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].
							].
						].
					].
				].
			].
		].
	].
].
].
].
].


firstPlayerGold :=11000.
maxitem :=4.

[(firstPlayerGold > 199) & (maxitem > 0.1)]
whileTrue:[
chosenItem := UIManager default chooseFrom: itemList message: 'Choose an Item for Player 2. Remaining Gold: ',firstPlayerGold asString,' Remaining Item Slots: ',maxitem asString, '.'.
chosenItem = 1
ifTrue: [
	maxitem>0.9
	ifTrue:[firstPlayerGold >= 4500
	ifTrue:[
	secondPlayer itemList: (secondPlayer itemList) with:(BattleFury  createNewItem). firstPlayerGold := firstPlayerGold -4500. maxitem := maxitem-1.]
	ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
	ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
	] 
ifFalse: [ chosenItem =2 
	ifTrue:[
		maxitem>0.9
		ifTrue:[firstPlayerGold >=2000
		ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(HoodofDefiance createNewItem). firstPlayerGold := firstPlayerGold -2000. maxitem := maxitem-1.]
		ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.]. ]
		ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
		] 
ifFalse:[chosenItem =3 
	ifTrue:[
		maxitem>0.9
		ifTrue:[firstPlayerGold >=1200
		ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(VitalityBooster createNewItem). firstPlayerGold := firstPlayerGold -1200. maxitem := maxitem-1.]
		ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.]. ]
		ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
		] 
	ifFalse:[chosenItem=4 
	ifTrue:[
		maxitem>0.9
		ifTrue:[	firstPlayerGold >=1100
		ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(EnergyBooster createNewItem). firstPlayerGold := firstPlayerGold-1100. maxitem := maxitem-1.]
		ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.]. ]
		ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.]

		]
	ifFalse:[chosenItem=5 
		ifTrue:[
			maxitem>0.9
			ifTrue:[firstPlayerGold >=5500
			ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(Butterfly createNewItem). firstPlayerGold := firstPlayerGold-5500. maxitem := maxitem-1.]
			ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
			ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
			]
		ifFalse:[chosenItem=6 
			ifTrue:[
			maxitem>0.9
			ifTrue:[firstPlayerGold >=5500
			ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(Daedalus createNewItem). firstPlayerGold := firstPlayerGold-5500. maxitem := maxitem-1.]
			ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
			ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
			] 
			ifFalse:[chosenItem=7 
			ifTrue:[
				maxitem>0.9
				ifTrue:[firstPlayerGold >=4000
				ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(Desolator createNewItem). firstPlayerGold := firstPlayerGold-4000. maxitem := maxitem-1.]
				ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
				ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
				] 
			ifFalse:[chosenItem=8
				ifTrue:[
					maxitem>0.9 
					ifTrue:[
						firstPlayerGold >=2500
						ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(Vanguard createNewItem). firstPlayerGold := firstPlayerGold-2500. maxitem := maxitem-1.]
						ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].
						]
					ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
				] 
				ifFalse:[chosenItem=9 
					ifTrue:[
						maxitem>0.9
						ifTrue:[firstPlayerGold >=5600
						ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(HeartofTarrasque createNewItem). firstPlayerGold := firstPlayerGold-5600. maxitem := maxitem-1.]
						ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].]
						ifFalse:[Transcript cr;show:'You do not have enough space to get this item. Take a potion.'.].
						] 
					ifFalse:[chosenItem=10
						 ifTrue:[
							firstPlayerGold >=200
							ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(HealthPotion createNewItem). firstPlayerGold := firstPlayerGold-200. maxitem := maxitem-0.5. GameArena secondPlayerhealthpotions: GameArena secondPlayerhealthpotions+1.]
							ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].
							] 
						ifFalse:[
							firstPlayerGold >=200
							ifTrue:[secondPlayer itemList: (secondPlayer itemList) with:(ManaPotion createNewItem). firstPlayerGold := firstPlayerGold-200. maxitem := maxitem-0.5. GameArena secondPlayermanapotions: GameArena secondPlayermanapotions+1.]
							ifFalse:[Transcript cr;show:'You do not have enough gold to get this item.'.].
							].
						].
					].
				].
			].
		].
	].
].
].
].
].

Transcript cr;show: 'The game is started...'.
chosenItem2 :=1.
count:=0.

[((firstPlayer hp) > 0.1) & ((secondPlayer hp) > 0.1)]
whileTrue:
[
Transcript cr;cr;show:'Player 1s turn!!'.
chosenItem := UIManager default chooseFrom: optionlistfirst message: 'Player 1s Turn. (',firstPlayer name1 asString,')'.
GameArena firstplayerchoice: firstPlayer with:secondPlayer  with:chosenItem  with:firstPlayerSkill1  with:firstPlayerSkill2.
(firstPlayer hp>0.1 & secondPlayer hp>0.1)
ifTrue:[
GameArena log:(firstPlayer name1) withhp:(firstPlayer hp) withmaxhp:(firstPlayer maxHp)  withmana:(firstPlayer mana)  withmaxmana:(firstPlayer maxMana)  withlastaction: (optionlistfirst at:chosenItem) with: count withname2:(secondPlayer name1) withhp2:(secondPlayer hp) withmaxhp2:(secondPlayer maxHp) withmana2:(secondPlayer mana) withmaxmana2:(secondPlayer maxMana) withlastaction2:(optionlistsecond at:chosenItem2).


Transcript cr;cr;show:'Player 2s turn!!'.
chosenItem2 := UIManager default chooseFrom: optionlistsecond message: 'Player 2s Turn. (',secondPlayer name1 asString,')'.
GameArena secondplayerchoice:secondPlayer with:firstPlayer with:chosenItem2 with:secondPlayerSkill1 with:secondPlayerSkill2. 
(firstPlayer hp>0.1 & secondPlayer hp>0.1)
ifTrue:[
	GameArena log:(firstPlayer name1) withhp:(firstPlayer hp) withmaxhp:(firstPlayer maxHp)  withmana:(firstPlayer mana)  withmaxmana:(firstPlayer maxMana)  withlastaction: (optionlistfirst at:chosenItem) with: count withname2:(secondPlayer name1) withhp2:(secondPlayer hp) withmaxhp2:(secondPlayer maxHp) withmana2:(secondPlayer mana) withmaxmana2:(secondPlayer maxMana) withlastaction2:(optionlistsecond at:chosenItem2). 
] 
ifFalse:[].
]
ifFalse:[].
count:=count+1.
].


Transcript cr; show:'The game is finished.'.
Transcript cr;show:'THE WINNER IS: '.
firstPlayer hp>secondPlayer hp
ifTrue: [ 
Transcript show:'First Player with hero: '; show:(firstPlayer name1).
Transcript cr;cr; show:'Player 1 Hero:'.
Transcript show:(firstPlayer name1).
Transcript cr;show:(firstPlayer hp).
Transcript show:'/'.
Transcript show:(firstPlayer maxHp).
Transcript show:' HP'.
Transcript cr;show:(firstPlayer mana).
Transcript show:'/';show:(firstPlayer maxMana).
Transcript show:' Mana'.
Transcript cr;show:'Last Action:'.
Transcript show:(optionlistfirst at:chosenItem).
Transcript cr;cr; show:'Player 2 Hero:'.
Transcript show:(secondPlayer name1).
Transcript cr;show:'0'.
Transcript show:'/'.
Transcript show:(secondPlayer maxHp).
Transcript show:' HP'.
Transcript cr;show:(secondPlayer mana).
Transcript show:'/';show:(secondPlayer maxMana).
Transcript show:' Mana'.
Transcript cr;show:'Last Action:'.
Transcript show:(optionlistsecond at:chosenItem2).
]
ifFalse:[ 
Transcript show:'Second Player with hero: '; show:(secondPlayer name1).
Transcript cr;cr; show:'Player 1 Hero:'.
Transcript show:(firstPlayer name1).
Transcript cr;show:'0'.
Transcript show:'/'.
Transcript show:(firstPlayer maxHp).
Transcript show:' HP'.
Transcript cr;show:(firstPlayer mana).
Transcript show:'/';show:(firstPlayer maxMana).
Transcript show:' Mana'.
Transcript cr;show:'Last Action:'.
Transcript show:(optionlistfirst at:chosenItem).
Transcript cr;cr; show:'Player 2 Hero:'.
Transcript show:(secondPlayer name1).
Transcript cr;show:(secondPlayer hp).
Transcript show:'/'.
Transcript show:(secondPlayer maxHp).
Transcript show:' HP'.
Transcript cr;show:(secondPlayer mana).
Transcript show:'/';show:(secondPlayer maxMana).
Transcript show:' Mana'.
Transcript cr;show:'Last Action:'.
Transcript show:(optionlistsecond at:chosenItem2).].
 

! !

!GameArena class methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:42'!
secondPlayerhealthpotions
	^ secondPlayerhealthpotions! !

!GameArena class methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:40'!
firstPlayermanapotions
	^ firstPlayermanapotions! !

!GameArena class methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:42'!
secondPlayerhealthpotions: anObject
	^ secondPlayerhealthpotions := anObject! !

!GameArena class methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:40'!
firstPlayerhealthpotions
	^ firstPlayerhealthpotions! !

!GameArena class methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 21:42'!
secondPlayermanapotions
	^ secondPlayermanapotions! !


Dota subclass: #Hero
	instanceVariableNames: 'hp maxHp name mana maxMana armour damage itemList skill1 skill2'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 22:09'!
maxMana
	^ maxMana! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:21'!
maxHp
	^ maxHp! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 01:20'!
skill1: anObject
	skill1 := anObject! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 22:09'!
armour: anObject
	armour := anObject! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 22:09'!
maxMana: anObject
	maxMana := anObject! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 22:09'!
mana: anObject
	mana := anObject! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 22:09'!
armour
	^ armour! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 22:09'!
damage
	^ damage! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 01:51'!
name: anObject
	name := anObject! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/20/2017 18:00'!
itemList: olditemlist with:anObject
	itemList := olditemlist copyWith: anObject.
! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:21'!
maxHp: anObject
	maxHp := anObject! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 01:20'!
skill2
	^ skill2! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 01:51'!
name1
	^ name! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 22:09'!
damage: anObject
	damage := anObject! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 01:20'!
skill2: anObject
	skill2 := anObject! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 01:20'!
skill1
	^ skill1! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 20:07'!
itemList
	^ itemList! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:21'!
hp: anObject
	hp := anObject! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:21'!
hp
	^ hp! !

!Hero methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 22:09'!
mana
	^ mana! !


!Hero methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 17:47'!
createInitialItemList

itemList:=#().! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Hero class
	instanceVariableNames: ''!

!Hero class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 19:22'!
createNewHeroInstance

^self subclassResponsibility. ! !


Dota subclass: #Item
	instanceVariableNames: 'isActive isDamage isMana isHP isDodge isArmour isChance damage mana hp chance armour dodge'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 21:03'!
isArmour
	^ isArmour! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 21:03'!
dodge: anObject
	dodge := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 21:03'!
dodge
	^ dodge! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isHP: anObject
	isHP := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 21:03'!
armour: anObject
	armour := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
mana: anObject
	mana := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isDamage
	^ isDamage! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 21:03'!
armour
	^ armour! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
damage
	^ damage! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isDamage: anObject
	isDamage := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isActive
	^ isActive! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 21:03'!
isDodge
	^ isDodge! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isChance: anObject
	isChance := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 21:03'!
isArmour: anObject
	isArmour := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isMana
	^ isMana! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
damage: anObject
	damage := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
chance
	^ chance! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isMana: anObject
	isMana := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isHP
	^ isHP! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isActive: anObject
	isActive := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
chance: anObject
	chance := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
hp: anObject
	hp := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
hp
	^ hp! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
isChance
	^ isChance! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 21:03'!
isDodge: anObject
	isDodge := anObject! !

!Item methodsFor: 'accessing' stamp: 'MerveCerit 5/18/2017 19:35'!
mana
	^ mana! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Item class
	instanceVariableNames: ''!

!Item class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 19:35'!
createNewItem
^self subclassResponsibility.! !


Item subclass: #BattleFury
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!BattleFury methodsFor: 'initialization' stamp: 'MerveCerit 5/18/2017 21:58'!
initialize

	cost:=4500.
	size:=1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

BattleFury class
	instanceVariableNames: ''!

!BattleFury class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:31'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 0.
tempObject isMana: 1.
tempObject isHP: 0.
tempObject isDamage: 1.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: 55.
tempObject mana: 50.
tempObject hp: 0.
tempObject chance:0.
^tempObject.! !


Item subclass: #Butterfly
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Butterfly methodsFor: 'initialization' stamp: 'MerveCerit 5/18/2017 21:59'!
initialize

	cost:=4500.
	size:=1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Butterfly class
	instanceVariableNames: ''!

!Butterfly class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:33'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 0.
tempObject isMana: 0.
tempObject isHP: 0.
tempObject isDamage: 1.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 1.
tempObject dodge: 25.
tempObject damage: 30.
tempObject mana: 0.
tempObject hp: 0.
tempObject chance:0.
^tempObject.! !


Item subclass: #Daedalus
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Daedalus methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:59'!
initialize

	cost:=5500.
	size:=1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Daedalus class
	instanceVariableNames: ''!

!Daedalus class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:40'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 1.
tempObject isMana: 0.
tempObject isHP: 0.
tempObject isDamage: 1.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: 75.
tempObject mana: 0.
tempObject hp: 0.
tempObject chance:25.
^tempObject.! !


Item subclass: #Desolator
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Desolator methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:59'!
initialize

	cost:=4000.
	size:=1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Desolator class
	instanceVariableNames: ''!

!Desolator class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:42'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 0.
tempObject isMana: 0.
tempObject isHP: 0.
tempObject isDamage: 1.
tempObject isArmour: 1.
tempObject armour: 5.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: 50.
tempObject mana: 0.
tempObject hp: 0.
tempObject chance:0.
^tempObject.! !


Item subclass: #EnergyBooster
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!EnergyBooster methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:59'!
initialize 
	cost:=1100.
	size:=1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

EnergyBooster class
	instanceVariableNames: ''!

!EnergyBooster class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:45'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 0.
tempObject isMana: 1.
tempObject isHP: 0.
tempObject isDamage: 0.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: 0.
tempObject mana: 250.
tempObject hp: 0.
tempObject chance:0.
^tempObject.! !


Item subclass: #HealthPotion
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!HealthPotion methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 22:00'!
initialize
cost:=200.
size:=0.5.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HealthPotion class
	instanceVariableNames: ''!

!HealthPotion class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:46'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 0.
tempObject isMana: 0.
tempObject isHP: 1.
tempObject isDamage: 0.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: 0.
tempObject mana: 0.
tempObject hp: 300.
tempObject chance:0.
^tempObject.! !


Item subclass: #HeartofTarrasque
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!HeartofTarrasque methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 22:00'!
initialize
cost:=5600.
size:=1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HeartofTarrasque class
	instanceVariableNames: ''!

!HeartofTarrasque class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:48'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 0.
tempObject isMana: 0.
tempObject isHP: 1.
tempObject isDamage: 0.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: 0.
tempObject mana: 0.
tempObject hp: 250.
tempObject chance:0.
^tempObject.! !


Item subclass: #HoodofDefiance
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!HoodofDefiance methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 22:00'!
initialize
cost:=2000.
size:=1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HoodofDefiance class
	instanceVariableNames: ''!

!HoodofDefiance class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:51'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 0.
tempObject isMana: 0.
tempObject isHP: 0.
tempObject isDamage: 1.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: 25.
tempObject mana: 0.
tempObject hp: 0.
tempObject chance:0.
^tempObject.! !


Item subclass: #ManaPotion
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!ManaPotion methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 22:00'!
initialize

cost:=200.
size:=0.5.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ManaPotion class
	instanceVariableNames: ''!

!ManaPotion class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:52'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 0.
tempObject isMana: 1.
tempObject isHP: 0.
tempObject isDamage: 0.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: 0.
tempObject mana: 300.
tempObject hp: 0.
tempObject chance:0.
^tempObject.! !


Hero subclass: #Scourge
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

Scourge subclass: #Leshrac
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Leshrac methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 22:48'!
initialize
	hp:=1518.
	mana:=1534.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Leshrac class
	instanceVariableNames: ''!

!Leshrac class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:22'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 1518.
tempObject hp: 1518.
tempObject maxMana:1534 .
tempObject mana:1534.
tempObject name:'Leshrac'.
tempObject armour: 12.
tempObject damage: (133 to:137) atRandom.
tempObject skill1:'SplitEarth'.
tempObject skill2:'PulseNova'.
tempObject createInitialItemList.
^tempObject .! !


Scourge subclass: #Lion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Lion methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 22:48'!
initialize
	hp:=1609.
	mana:=1456.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Lion class
	instanceVariableNames: ''!

!Lion class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:23'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 1609.
tempObject hp: 1609.
tempObject maxMana: 1456.
tempObject mana:1456.
tempObject name:'Lion'.
tempObject armour: 9.
tempObject damage: (139 to:145) atRandom.
tempObject skill1:'EarthSpike'.
tempObject skill2:'FingerofDeath'.
tempObject createInitialItemList.
^tempObject .! !


Scourge subclass: #Mortred
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Mortred methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 22:49'!
initialize
	hp:=1754.
	mana:=892.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Mortred class
	instanceVariableNames: ''!

!Mortred class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:25'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 1754.
tempObject hp: 1754.
tempObject maxMana: 892.
tempObject mana:892.
tempObject name:'Mortred'.
tempObject armour: 18.
tempObject damage: (142 to:144) atRandom.
tempObject skill1:'Blur'.
tempObject skill2:'CoupdeGrace'.
tempObject createInitialItemList.
^tempObject .! !


Scourge subclass: #NyxAssassin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!NyxAssassin methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 22:49'!
initialize
	hp:=1784.
	mana:=1149.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

NyxAssassin class
	instanceVariableNames: ''!

!NyxAssassin class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:26'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 1784.
tempObject hp: 1784.
tempObject maxMana: 1149.
tempObject mana:1149.
tempObject name:'Nyx Assassin'.
tempObject armour: 14.
tempObject damage: (122 to:126) atRandom.
tempObject skill1:'Impale'.
tempObject skill2:'ManaBurn'.
tempObject createInitialItemList.
^tempObject .! !


Hero subclass: #Sentinel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

Sentinel subclass: #Earthshaker
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Earthshaker methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 22:51'!
initialize
	hp:=2270.
	mana:=1030.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Earthshaker class
	instanceVariableNames: ''!

!Earthshaker class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:31'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 2270.
tempObject hp: 2270.
tempObject maxMana: 1030.
tempObject name: 'Earthshaker'.
tempObject mana:1030.
tempObject armour: 10.
tempObject damage: (136 to:146) atRandom.
tempObject skill1:'Fissure'.
tempObject skill2:'Enchant Totem'.
tempObject createInitialItemList.
^tempObject .! !


Sentinel subclass: #Magina
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Magina methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 22:50'!
initialize
	hp:=1495.
	mana:=1017.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Magina class
	instanceVariableNames: ''!

!Magina class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:31'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 1495.
tempObject hp: 1495.
tempObject maxMana: 1017.
tempObject name: 'Magina'.
tempObject mana:1017.
tempObject armour: 14.
tempObject skill1:'Mana Break'.
tempObject skill2:'Mana Void'.
tempObject damage: (136 to:140) atRandom.
tempObject createInitialItemList.
^tempObject .! !


Sentinel subclass: #Mirana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Mirana methodsFor: 'initialization' stamp: 'MerveCerit 5/18/2017 22:19'!
initialize
	hp:=1697.
	mana:=996.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Mirana class
	instanceVariableNames: ''!

!Mirana class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 01:52'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 1495.
tempObject hp: 1495.
tempObject maxMana: 996.
tempObject name: 'Mirana'.
tempObject mana:996.
tempObject armour: 16.
tempObject damage: (137 to:148) atRandom.
tempObject skill1:'Starstorm'.
tempObject skill2:'Sacred Arrow'.
tempObject createInitialItemList.
^tempObject .! !


Sentinel subclass: #OgreMagi
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!OgreMagi methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 22:50'!
initialize
	hp:=2426.
	mana:=1105.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

OgreMagi class
	instanceVariableNames: ''!

!OgreMagi class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:32'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 2426.
tempObject hp: 2426.
tempObject maxMana: 1105.
tempObject name: 'Ogre Magi'.
tempObject mana:1105.
tempObject armour: 16.
tempObject damage: (126 to:132) atRandom.
tempObject skill1:'Fireblast'.
tempObject skill2:'Multicast'.
tempObject createInitialItemList.
^tempObject .! !


Sentinel subclass: #Rylai
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Rylai methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 22:50'!
initialize
	hp:=1609.
	mana:=1373.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Rylai class
	instanceVariableNames: ''!

!Rylai class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 22:33'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 1609.
tempObject hp: 1609.
tempObject maxMana: 1373.
tempObject name: 'Rylai'.
tempObject mana:1373.
tempObject armour: 9.
tempObject damage: (125 to:131) atRandom.
tempObject skill1:'Frostbite'.
tempObject skill2:'Freezing Field'.
tempObject createInitialItemList.
^tempObject .! !


Scourge subclass: #SkeletonKing
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!SkeletonKing methodsFor: 'initialization' stamp: 'MerveCerit 5/18/2017 22:18'!
initialize
	hp:=2270.
	mana:=993.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

SkeletonKing class
	instanceVariableNames: ''!

!SkeletonKing class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:28'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 2270.
tempObject hp: 2270.
tempObject maxMana: 993.
tempObject mana:993.
tempObject armour: 11.
tempObject damage: (151 to:153) atRandom.
tempObject skill1:'WraithfireBlast'.
tempObject skill2:'VampiricAura'.
tempObject name: 'Skeleton King'.
tempObject createInitialItemList.
^tempObject .! !


Dota subclass: #Skill
	instanceVariableNames: 'isActive cooldown manausage name'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Skill methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 11:46'!
manausage: anObject
	manausage := anObject! !

!Skill methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 11:46'!
cooldown
	^ cooldown! !

!Skill methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 11:47'!
isActive
	^ isActive! !

!Skill methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 11:46'!
cooldown: anObject
	cooldown := anObject! !

!Skill methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 11:47'!
isActive: anObject
	isActive := anObject! !

!Skill methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 12:55'!
name: anObject
	name := anObject! !

!Skill methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 11:46'!
manausage
	^ manausage! !

!Skill methodsFor: 'accessing' stamp: 'MerveCerit 5/19/2017 12:55'!
name1
	^ name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Skill class
	instanceVariableNames: ''!

!Skill class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 11:48'!
createNewSkill
^self subclassResponsibility.! !


Skill subclass: #AnchorSmash
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!AnchorSmash methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/20/2017 13:12'!
initialize
cooldown:= 3.
manausage:= 60.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

AnchorSmash class
	instanceVariableNames: ''!

!AnchorSmash class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:22'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 3.
tempObject manausage: 60.
tempObject name:'Anchor Smash'.
^tempObject.! !


Skill subclass: #Blur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Blur class
	instanceVariableNames: ''!

!Blur class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:22'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject cooldown: 0.
tempObject manausage: 0.
tempObject name:'Blur'.
^tempObject.! !


Skill subclass: #CoupdeGrace
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

CoupdeGrace class
	instanceVariableNames: ''!

!CoupdeGrace class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:22'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject cooldown: 0.
tempObject manausage: 0.
tempObject name:'Coup de Grace'.
^tempObject.! !


Skill subclass: #EarthSpike
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

EarthSpike class
	instanceVariableNames: ''!

!EarthSpike class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:22'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 160.
tempObject name:'Earth Spike'.
^tempObject.! !


Skill subclass: #EnchantTotem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

EnchantTotem class
	instanceVariableNames: ''!

!EnchantTotem class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:22'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 50.
tempObject name:'Enchant Totem'.
^tempObject.! !


Skill subclass: #FingerofDeath
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

FingerofDeath class
	instanceVariableNames: ''!

!FingerofDeath class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:21'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 8.
tempObject manausage: 650.
tempObject name:'Finger of Death'.
^tempObject.! !


Skill subclass: #Fireblast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Fireblast class
	instanceVariableNames: ''!

!Fireblast class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:21'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 225.
tempObject name:'Fireblast'.
^tempObject.! !


Skill subclass: #Fissure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Fissure class
	instanceVariableNames: ''!

!Fissure class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:21'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 170.
tempObject name:'Fissure'.
^tempObject.! !


Skill subclass: #FreezingField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

FreezingField class
	instanceVariableNames: ''!

!FreezingField class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:21'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 8.
tempObject manausage: 600.
tempObject name:'Freezing Field'.
^tempObject.! !


Skill subclass: #Frostbite
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Frostbite class
	instanceVariableNames: ''!

!Frostbite class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:21'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 150.
tempObject name:'Frost Bite'.
^tempObject.! !


Skill subclass: #GodsStrength
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!GodsStrength methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 13:17'!
initialize
cooldown:= 5.
manausage:= 200.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GodsStrength class
	instanceVariableNames: ''!

!GodsStrength class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:20'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 200.
tempObject name:'Gods Strength'.
^tempObject.! !


Skill subclass: #Impale
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Impale class
	instanceVariableNames: ''!

!Impale class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:20'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 225.
tempObject name:'Impale'.
^tempObject.! !


Skill subclass: #ManaBreak
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ManaBreak class
	instanceVariableNames: ''!

!ManaBreak class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:20'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject cooldown: 0.
tempObject manausage: 0.
tempObject name:'Mana Break'.
^tempObject.! !


Skill subclass: #ManaBurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ManaBurn class
	instanceVariableNames: ''!

!ManaBurn class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:20'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 50.
tempObject name:'Mana Burn'.
^tempObject.! !


Skill subclass: #ManaVoid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ManaVoid class
	instanceVariableNames: ''!

!ManaVoid class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:20'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 7.
tempObject manausage: 275.
tempObject name:'Mana Void'.
^tempObject.! !


Skill subclass: #Multicast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Multicast class
	instanceVariableNames: ''!

!Multicast class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:19'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject cooldown: 0.
tempObject manausage: 0.
tempObject name:'Multicast'.
^tempObject.! !


Skill subclass: #PulseNova
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

PulseNova class
	instanceVariableNames: ''!

!PulseNova class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:19'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 0.
tempObject manausage: 150.
tempObject name:'Pulse Nova'.
^tempObject.! !


Skill subclass: #Ravage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Ravage methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 13:19'!
initialize
cooldown:=8.
manausage:=325.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Ravage class
	instanceVariableNames: ''!

!Ravage class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:19'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 8.
tempObject manausage: 325.
tempObject name:'Ravage'.
^tempObject.! !


Skill subclass: #SacredArrow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!SacredArrow methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 13:20'!
initialize
cooldown:=4.
manausage:=100.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

SacredArrow class
	instanceVariableNames: ''!

!SacredArrow class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:19'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 4.
tempObject manausage: 100.
tempObject name:'Sacred Arrow'.
^tempObject.! !


Skill subclass: #SplitEarth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

SplitEarth class
	instanceVariableNames: ''!

!SplitEarth class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:18'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 160.
tempObject name:'Split Earth'.
^tempObject.! !


Skill subclass: #Starstorm
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Starstorm methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 13:20'!
initialize
cooldown:=4.
manausage:=160.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Starstorm class
	instanceVariableNames: ''!

!Starstorm class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:18'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 4.
tempObject manausage: 160.
tempObject name:'Starstorm'.
^tempObject.! !


Skill subclass: #StormHammer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!StormHammer methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 13:21'!
initialize
cooldown:=5.
manausage:=140.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

StormHammer class
	instanceVariableNames: ''!

!StormHammer class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:18'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 140.
tempObject name:'Storm Hammer'.
^tempObject.! !


Sentinel subclass: #Sven
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Sven methodsFor: 'initialization' stamp: 'MerveCerit 5/18/2017 22:19'!
initialize
	hp:=2198.
	mana:=874.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Sven class
	instanceVariableNames: ''!

!Sven class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 01:52'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 2198.
tempObject hp: 2198.
tempObject maxMana: 874.
tempObject name: 'Sven'.
tempObject mana:874.
tempObject armour: 14.
tempObject damage: (149 to:151) atRandom.
tempObject skill1:'Storm Hammer'.
tempObject skill2:'Gods Strength'.
tempObject createInitialItemList.
^tempObject .! !


Scourge subclass: #Tidehunter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Tidehunter methodsFor: 'initialization' stamp: 'MerveCerit 5/18/2017 22:18'!
initialize
	hp:=2316.
	mana:=998.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Tidehunter class
	instanceVariableNames: ''!

!Tidehunter class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:28'!
createNewHeroInstance

|tempObject|

tempObject := self basicNew.
tempObject maxHp: 2316.
tempObject hp: 2316.
tempObject maxMana: 998.
tempObject mana:998.
tempObject name:'Tidehunter'.
tempObject armour: 11.
tempObject damage: (139 to:145) atRandom.
tempObject skill1:'AnchorSmash'.
tempObject skill2:'Ravage'.
tempObject createInitialItemList.
^tempObject .! !


Skill subclass: #VampiricAura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!VampiricAura methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 13:18'!
initialize
cooldown:= 0.
manausage:= 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

VampiricAura class
	instanceVariableNames: ''!

!VampiricAura class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:18'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject cooldown: 0.
tempObject manausage: 0.
tempObject name:'Vampiric Aura'.
^tempObject.! !


Item subclass: #Vanguard
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!Vanguard methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 22:00'!
initialize
cost:=2500.
size:=1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Vanguard class
	instanceVariableNames: ''!

!Vanguard class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:56'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 1.
tempObject isMana: 0.
tempObject isHP: 1.
tempObject isDamage: 1.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: -60.
tempObject mana: 0.
tempObject hp: 250.
tempObject chance:20.
^tempObject.! !


Item subclass: #VitalityBooster
	instanceVariableNames: 'cost size'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!VitalityBooster methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 22:00'!
initialize
cost:=1200.
size:=1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

VitalityBooster class
	instanceVariableNames: ''!

!VitalityBooster class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/18/2017 21:57'!
createNewItem

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 0.
tempObject isChance: 0.
tempObject isMana: 0.
tempObject isHP: 1.
tempObject isDamage: 0.
tempObject isArmour: 0.
tempObject armour: 0.
tempObject isDodge: 0.
tempObject dodge: 0.
tempObject damage: 0.
tempObject mana: 0.
tempObject hp: 250.
tempObject chance:0.
^tempObject.! !


Skill subclass: #WraithfireBlast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2012402015'!

!WraithfireBlast methodsFor: 'initialization' stamp: 'MerveCerit 5/20/2017 13:18'!
initialize
cooldown:= 5.
manausage:= 140.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

WraithfireBlast class
	instanceVariableNames: ''!

!WraithfireBlast class methodsFor: 'as yet unclassified' stamp: 'MerveCerit 5/19/2017 12:17'!
createNewSkill

|tempObject|

tempObject :=self basicNew.
tempObject isActive: 1.
tempObject cooldown: 5.
tempObject manausage: 140.
tempObject name:'Wraithfire Blast'.
^tempObject.! !
