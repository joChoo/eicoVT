


// CURRENT LOCALIZER TYPE
//========================

// let currentUser:PFUser = PFUser.currentUser()


// NEXUS
//------------------------
// ***********************
// parent:[] = []
// brother:[Entity] = []
// children:[Team] = []
// ***********************


/*
 let templatesQuery:PFQuery = PFQuery(className:"Entity")
 templatesQuery.whereKey("type", equalsTo:"template")
 templatesQuery.findObjectInBackGround()
 brother.append(sequence of:[templatesQuery.success])
 
 let teamsQuery:PFQuery = PFQuery(className:"Team")
 teamsQuery.whereKey("members", contains:currentUser)
 teamsQuery.findObjectInBackGround()
 children.append(squence of:[teamsQuery.success])
 */



// TEAM
//------------------------
// ***********************
// parent:[Nexus] = Nexus()
// brother:[Team] = []
// children:[Entity] = []
// ***********************


/*
 let nexus:Nexus = Nexus()
 parent.append(nexus)
 
 let teamsQuery:PFQuery = PFQuery(className:"Team")
 teamsQuery.whereKey("members", contains:currentUser)
 teamsQuery.whereKey("objectId", isNotEqual:"\(currentLocalizer.objectId)")
 teamsQuery.findObjectInBackGround()
 brother.append(squence of:[teamsQuery.success])
 
 let samplesQuery:PFQuery = PFQuery(className:"Entity")
 samplesQuery.whereKey("hasGranted", contains:currentUser)
 samplesQuery.findObjectInBackground()
 children.append(sequence: [sampkesQuery.success])
 
 */


// ENTITY
//------------------------
// ***********************
// parent:[Team] = []
// brother:[Entity] = []
// children:[Part] = []
// ***********************

/*
 
 let grantedTeamsQuery:PFQuery = PFQuery(className:"Entity")
 grantedTeamsQuery.whereKey("hasGranted", contains:currentUser)
 let myGrantedTeamsQuery:PFQuery = PFQuery(className:"Team")
 myGrantedTeamsQuery.whereKey("members", contains:currentUser)
 myGrantedTeamsQuery.matches(grantedTeamsQuery)
 
 
 
 
 
 */

// PARTS
//------------------------
// ***********************
// parent:[Part] = []
// brother:[Part] = []
// children:[Part+Subpart] = []
// ***********************


// SUBPARTS
//------------------------
// ***********************
// parent:[Part] = []
// brother:[] = []
// children:[] = []
// ***********************
