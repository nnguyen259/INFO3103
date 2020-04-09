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
	selectedMagic:{}
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
    
    turnOnEdit(){
    	this.editMode = true;
    },
    
    turnOffEdit(){
    	this.editMode = false;
    	this.selectProject(this.selectedProject.id);
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
    	})
    }
    
  },
  //------- END methods --------
  computed: {
	  categories(){
		  axios.get(this.serviceURL+"/categories")
		  .then(response => {
			  return response.data.categories;
		  })
	  }
  }
});
