//Gets the current height of the screen.
var headerHeight = document.getElementById('header').clientHeight;
var screenHeight = $(window).height() - headerHeight - 10; 
var row = $('.row');

// Assign that height to the .row
row.css({
    'height': screenHeight + 'px',
});

// This makes the div's height responsive when you resize the screen or the window of the browser.
$(window).resize(function () {
    screenHeight = $(window).height();
    row.css({
        'height': screenHeight + 'px',
    });
});

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
	editMode: false,
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
      console.log(response);
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
        	console.log(response);
            if (response.data.status == "success") {
			  console.log("success");
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
    	this.selectedProject.id = "";
    	this.selectedProject.owner = "";
    	this.selectedProject.name = "";
    	this.selectedProject.isPublic = "";
    },
	
	selectProject(projectId){
		for (x in this.projectsData){
			if (this.projectsData[x].schoolId == schoolId) {
				this.selectedProject = this.projectData[x];
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
  }
  //------- END methods --------

});
