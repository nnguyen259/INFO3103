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
	eligibleProjects:{}
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
    },
	
	selectProject(projectId){
		for (x in this.projectsData){
			if (this.projectsData[x].id == projectId) {
				this.selectedProject = JSON.parse(JSON.stringify(this.projectsData[x]));
				this.creatingProject = false;
			}
		}
	},
	
	getPublic() {
      axios
      .get(this.serviceURL+"/projects")
      .then(response => {
          this.projectsData = response.data.projects;
          document.body.style.backgroundColor= "lightgreen";
      })
      .catch(e => {
        alert("Unable to load the school data");
        console.log(e);
      });
      
    },
    
    getPrivate() {
    	this.projectsData = null;
    	document.body.style.backgroundColor= "lightblue";
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
    	}
    },
    
    turnOnEdit(){
    	this.editMode = true;
    }
    
  },
  //------- END methods --------

});
