// register modal component
 Vue.component("modal", {
   template: "#modal-template"
 });

var app = new Vue({
  el: "#app",

  //------- data --------
  data: {
    serviceURL: "https://info3103.cs.unb.ca:8034",
    authenticated: false,
    projectsData: null,
    loggedIn: null,
    input: {
      username: "",
      password: ""
    },
	creatingProject: true,
	editMode: false,
	currentTab: "Public",
	selectedProject: {
		id: "",
		isPublic: "",
		name: "",
		owner: ""
	},
	eligibleProjects:{},
	viewMagic: false,
	editMagic: false,
	magicData: null,
	selectedMagic:{},
	categories: null,
	characters: null,
	effects: null,
	targetTypes: null,
	types: null,
	elements: null,
	effect1:{},
	effect2:{}
  },
  //------- lifecyle hooks --------
  mounted: function() {
    axios
    .get(this.serviceURL+"/signin")
    .then(response => {
      if (response.data.status == "success") {
        this.authenticated = true;
        this.loggedIn = response.data.user_id;
        this.createProject();
      }
    })
    .catch(error => {
        this.authenticated = false;
        console.log(error);
    });
    this.getPublic();
    this.getCategories();
    this.getTypes();
    this.getCharacters();
    this.getTargetTypes();
    this.getEffects();
    this.getElements();
  },
  //------- methods --------
  methods: {
    login() {
      if (this.input.username != "" && this.input.password != "") {
        axios
        .post(this.serviceURL+"/signin", {
            "username": this.input.username,
            "password": this.input.password
        })
        .then(response => {
            if (response.data.status == "success") {
              this.authenticated = true;
              this.loggedIn = response.data.user_id;
            }
        })
        .catch(e => {
            alert("The username or password was incorrect, try again");
            this.input.password = "";
            console.log(e);
        });
      } else {
        alert("A username and password must be present");
      }
    },


    logout() {
      axios
      .delete(this.serviceURL+"/signin")
      .then(response => {
          location.reload();
      })
      .catch(e => {
        console.log(e);
      });
    },
    
    createProject(){
    	this.selectedProject = {id: 1, isPublic: 1};
    	this.creatingProject = true;
    	this.getEligibleToBased();
    	$('.list-group-item.list-group-item-action').removeClass('active');
    	this.editMagic = false;
    	this.selectedMagic = {};
    	this.editMode = false;
    	this.viewMagic = false;
    	this.editMagic = false;
    	this.magicData = null;
    },
	
	selectProject(projectId){
		for (x in this.projectsData){
			if (this.projectsData[x].id == projectId) {
				this.selectedProject = JSON.parse(JSON.stringify(this.projectsData[x]));
				this.creatingProject = false;
				this.magicData = null;
				this.viewMagic = false;
			}
		}
	},
	
	getPublic() {
	  this.currentTab = "Public";
      axios
      .get(this.serviceURL+"/projects")
      .then(response => {
          this.projectsData = response.data.projects;
          document.body.style.backgroundColor= "lightgreen";
          $('.list-group-item.list-group-item-action').removeClass('active');
      })
      .catch(e => {
        alert("Unable to load the school data");
        console.log(e);
      });
      
    },
    
    getPrivate() {
    	this.currentTab = "Private";
    	axios
    	.get(this.serviceURL+"/user/"+this.loggedIn+"/projects")
    	.then(response => {
    		this.projectsData = response.data.projects;
    		document.body.style.backgroundColor= "lightblue";
    		$('.list-group-item.list-group-item-action').removeClass('active');
    	})
    },
    
    getShared() {
    	this.projectsData = null;
    	document.body.style.backgroundColor= "Sandybrown";
    },
    
    getEligibleToBased(){
    	axios
    	.all([
    		axios.get(this.serviceURL+"/projects"),
    		axios.get(this.serviceURL+"/user/"+this.loggedIn+"/projects")
    	])
    	.then(axios.spread((arr1, arr2) => {
    		this.eligibleProjects = arr1.data.projects.concat(arr2.data.projects);
    	}));
    },
    
    submitProject(){
    	if(!this.editMode){
    		axios
    		.post(this.serviceURL+"/projects", {
    			'Name': this.selectedProject.name,
    			'Base': this.selectedProject.id,
    			'Visibility': this.selectedProject.isPublic
    		})
    		.then(response => {
    			if(this.currentTab === "Public") this.getPublic();
    			if(this.currentTab === "Private") this.getPrivate();
    			if(this.currentTab === "Shared") this.getShared();
    			this.creatingProject = false;
    			return axios.get(response.data.uri);
    		})
    		.then(response => {
    			this.selectedProject = JSON.parse(JSON.stringify(response.data.project[0]));
    			this.creatingProject = false;
    		})
    	} else {
    		axios.put(this.serviceURL+"/projects/"+this.selectedProject.id, {
    			'Name': this.selectedProject.name,
    			'Visibility': this.selectedProject.isPublic
    		})
    		.then(response => {
    			if(this.currentTab === "Public") this.getPublic();
    			if(this.currentTab === "Private") this.getPrivate();
    			if(this.currentTab === "Shared") this.getShared();
    			return axios.get(response.data.uri);
    		})
    		.then(response => {
    			this.selectedProject = JSON.parse(JSON.stringify(response.data.project[0]));
    			this.editMode = false;
    		})
    	}
    },
    
    submitMagic(){
		axios.put(this.serviceURL+"/projects/"+this.selectedProject.id+"/magics/"+this.selectedMagic.magic_id, {
			'sort_id': this.selectedMagic.sort_id,
			'label': this.selectedMagic.label,
			'name': this.selectedMagic.name,
			'animation': this.selectedMagic.animation,
			'description': this.selectedMagic.description,
			
			'character_id': this.selectedMagic.character.id,
			'category_id': this.selectedMagic.category.id,
			'type_id': this.selectedMagic.type.id,
			'element_id': this.selectedMagic.element.id,
			
			'target_type_id': this.selectedMagic.target_type.id,
			'target_range': this.selectedMagic.target_range,
			'target_size': this.selectedMagic.target_size,
			
			'unbalance': this.selectedMagic.unbalance,
			'cost': this.selectedMagic.cost,
			'cast_delay': this.selectedMagic.cast_delay,
			'recovery_delay': this.selectedMagic.recovery_delay,
			'level_learn': this.selectedMagic.level_learn,
			
			'effect1_id': this.effect1.id,
			'effect1_data1': this.selectedMagic.effect1.data1,
			'effect1_data2': this.selectedMagic.effect1.data2,
			
			'effect2_id': this.effect2.id,
			'effect2_data1': this.selectedMagic.effect2.data1,
			'effect2_data2': this.selectedMagic.effect2.data2
		})
		.then(response => {
			return axios.get(response.data.uri);
		})
		.then(response => {
			this.selectedMagic = JSON.parse(JSON.stringify(response.data.magic[0]));
			this.editMagic = false;
		})
    },
    
    turnOnEdit(){
    	this.editMode = true;
    },
    
    turnOffEdit(){
    	this.editMode = false;
    	this.selectProject(this.selectedProject.id);
    },
    
    turnOffEditMagic(){
    	this.editMagic = false;
    	this.selectMagic(this.selectedMagic.magic_id);
    },
    
    deleteProject(){
    	axios
    	.delete(this.serviceURL+"/projects/"+this.selectedProject.id)
    	.then(response => {
			if(this.currentTab === "Public") this.getPublic();
			if(this.currentTab === "Private") this.getPrivate();
			if(this.currentTab === "Shared") this.getShared();
			this.createProject();
		})
    },
    
    getMagic(){
    	axios
    	.get(this.serviceURL+"/projects/"+this.selectedProject.id+"/magics")
    	.then(response => {
    		this.magicData = response.data.magic;
    	})
    },
    
    selectMagic(magicId){
    	axios.get(this.serviceURL+"/projects/"+this.selectedProject.id+"/magics/"+magicId)
    	.then(response => {
    		this.selectedMagic = response.data.magic[0];
    		this.viewMagic = true;
    		this.getEffect1(response.data.magic[0].effect1.id);
    		this.getEffect2(response.data.magic[0].effect2.id);
    	})
    },
    
    getCategories(){
	  axios.get(this.serviceURL+"/categories")
	  .then(response => {
		  this.categories = response.data.categories;
	  })
    },
    
    getTypes(){
	  axios.get(this.serviceURL+"/types")
	  .then(response => {
		  this.types = response.data.types;
	  })
    },
    
    getCharacters(){
	  axios.get(this.serviceURL+"/characters")
	  .then(response => {
		  this.characters = response.data.characters;
	  })
    },
  
    getTargetTypes(){
	  axios.get(this.serviceURL+"/targetTypes")
	  .then(response => {
		  this.targetTypes = response.data.targetTypes;
	  })
  	},
  	
  	getEffects(){
  		axios.get(this.serviceURL+"/effects")
  		.then(response => {
  			this.effects = response.data.effects;
  		})
  	},
  	
  	getElements(){
  		axios.get(this.serviceURL+"/elements")
  		.then(response => {
  			this.elements = response.data.elements;
  		})
  	},
  	
  	getEffect1(effectId){
  		axios.get(this.serviceURL+"/effects/"+effectId)
  		.then(response => {
  			this.effect1 = response.data.effect[0];
  		})
  	},
  	
  	getEffect2(effectId){
  		axios.get(this.serviceURL+"/effects/"+effectId)
  		.then(response => {
  			this.effect2 = response.data.effect[0];
  		})
  	}
    
  },
  //------- END methods --------
});
