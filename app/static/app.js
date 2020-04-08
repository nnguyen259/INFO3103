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
	currentTab: "Public",
	selectedProject: {
		id: "",
		isPublic: "",
		name: "",
		owner: ""
	}
  },
  //------- lifecyle hooks --------
  mounted: function() {
    axios
    .get(this.serviceURL+"/signin")
    .then(response => {
      if (response.data.status == "success") {
        this.authenticated = true;
        this.loggedIn = response.data.user_id;
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
    	this.selectedProject = {};
    	this.creatingProject = true;
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
    	var publicArray = "";
    	axios
    	.get(this.serviceURL+"/projects")
    	.then(response => {
    		publicArray = response.data.projects;
    	});
    	
    	var userCreatedArray = "";
    	axios
    	.get(this.serviceURL+"/user/"+this.loggedIn+"/projects")
    	.then(response => {
    		$.extend(publicArray, response.data.projects);
    		for(x in publicArray){
    			console.log(publicArray[x]);
    		}
    		return 1;
    	});
    	
    },
    
    
  },
  //------- END methods --------

});
