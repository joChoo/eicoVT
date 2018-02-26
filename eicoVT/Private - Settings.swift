//
//  Private - Settings.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 14/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit


enum SettingType {
    case text, bool, list, pointer
}

class LocalizerSetting {
    
    var name:String
    var title:String
    var type:SettingType
    var isEditable:Bool
    
    init(name:String, type:SettingType, title:String, isEditable:Bool){
    
        self.name = name
        self.title = title
        self.type = type
        self.isEditable = isEditable

    }
}



/*
 
 ----------------------------------
 NEXUS
 
 ====== Mandatory
 Title
 Description
 
 ====== Facultative
 Number of teams
 Number of entities
 Number of templates
 Number of diagnosises
 Number of semiology
 
====== Options
 Nil
 
 -----------------------------------
 TEAM
 
 ====== Mandatory
    Name of the team :String
    description :String
    tags :
    date of creation :Date
    firstMember :ECUser
 
 ====== Facultative
    members:[ECUser]
 
 ====== Options
    addMembers:[ECUser]


 
-----------------------------------
 ENTITY
 
====== Mandatory
 first name
 last name
 optional name
 sex
 birth
 
====== Facultative
 reference
 father
 mother
 brothers and sisters
 
====== Options
 relatives:[Entities]
 

 
 
 
 
-----------------------------------
 PART
 
 ====== Mandatory
 preferred label
 type
 definition
 is obsolete
 
 ====== Facultative
 
 
 
 
 ====== Options
 parts
 subparts
 
 parents
 adheres to
 adjacent
 adjacent to
 afferent to
 anatomical entity observed
 anatomical landmark for
 anatomical plane
 anterior to
 anterolateral to
 anteromedial to
 anterosuperior to
 AP Position
 arterial supply of
 articulates with
 attaches to
 attributed constitutional part
 attributed development
	attributed part	
 attributed regional part
	author	
 authority
	bounded by
	bounds	
 branch
	branch  continuity
	branch of
	cell appendage type	
 CMA label	
 connected to
	connecting part	
 connection type
	constitutional part
	constitutional part of
	contained in	
 contains
	continuous distally with
	continuous proximally with	
 continuous with
	contributing author	
 corresponds to	
 creator	
 date entered modified	
 days post-fertilization
	definition
	derives
	derives from
	development type
	developmental fusion
	developmental stage of	
 develops from
	develops into
	dimension
	direct left of
	direct right of
	distal to
	drains into	
 efferent to
	English equivalent
 external to

 forms	
 full grown phenotype
	fuses with
	fusion of
	germ origin
	gestation age  weeks	
 has anatomical landmark	
 has boundary	
 has developmental stage	
 has dimension	
 has direct cell layer
	has direct cell shape	
 has direct number of pairs per nucleus	
 has direct ploidy	
 has direct shape type	
 has direct shape type	
 has inherent 3-D shape	
 has insertion	
 has location	
 has mass
has origin
	has projection
	homonym for
	homonym of
 prefix IRI
 anatomical coordinates
 laterality
inferior to	
 inferolateral to
	inferomedial to	
 inherent 3-D shape	
 input from
	insertion of
	is boundary of
	JHU DTI-81	JHU White-Matter Tractography Atlas	language
	lateral to	
 Latin name  
 TA	
 left lateral to
	left medial to	
 located in
	location of	
 lymphatic drainage	
 lymphatic drainage of	
 matures into	
 matures_from	
 medial to	
 member
	member of	
 merges with	
 merging of
	modification
	modified by
	muscle attachment
	name	
 nerve supply
	nerve supply of
	nerve supply type
	Neurolex	
 Neurolex ID	
 NeuroQuant
	NN abbreviations
	non-English equivalent	
 nucleus of 
 origin of	
 nucleus of termination of
	orientation	origin of
	other Latin equivalents	
 outdated meaning	
 output to	part
	part of	part type	
 partition	
 percentage
	physical state	
 PI-RADS v1 16 ID	PI-RADS v1 27 ID	PI-RADS v2 ID	
 polarity	
 posterior to
	posteroinferior to	
 posterolateral to	
 posteromedial to	
 posterosuperior to	
 preferred name	
 primary author and curator	
 primary segmental supply	
 primary segmental supply of
	projects from	
 projects to	
 proximal to	
 RadLex ID	
 rank of tissue	
 receives attachment from
	receives drainage from
	receives input from	
 receives projection
	reference	
 regional part	
 regional part of
 related developmental entity
	related object	
 related part	
 right lateral to	
 right medial to	
 RO ID	
 secondary segmental supply	secondary
 segmental supply of
	segmental composition
	segmental composition of
	segmental contribution from	
 segmental contribution to
	segmental innervation
 segmental supply
	segmental supply of
	sends output to	
 sensory nerve supply
	slot synonym	
 species	
 state	
 state of determination	
 superior to
	superior-inferior position
 superolateral to	
 superomedial to
	surrounded by
	surrounds	
 synonym	
 TA ID	
 Talairach
	Talairach ID
	technical support
	term 
 status	
 transforms from
	transforms into	
 tributary
	tributary  continuity	
 tributary of
	UMLS ID	union
	unites with	venous drainage	venous drainage of
	view
 type
 fma
 
 parts
 subparts
 
 

 
 
 
 
 -----------------------------------
 SUBPART
 
 
 
 
 
 
 */
