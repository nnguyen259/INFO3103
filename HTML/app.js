//Gets the current height of the screen.
var headerHeight = document.getElementById('header').clientHeight;
var buttonsHeight = document.getElementById('buttons').clientHeight;
var screenHeight = $(window).height() - headerHeight - buttonsHeight - 10; 
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
    authenticated: true,
    projectsData: null,
    loggedIn: null,
    input: {
      username: "",
      password: ""
    },
	currentTab: "Private",
	selectedProject: {
		id: "",
		isPublic: "",
		name: "",
		owner: ""
	}
  },
  //------- lifecyle hooks --------
  /*mounted: function() {
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
  },*/
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
      alert("No magic on the server yet. You'll have to write the logout code there.");
      axios
      .delete(this.serviceURL+"/signin")
      .then(response => {
          location.reload();
      })
      .catch(e => {
        console.log(e);
      });
    },
	
	deleteSchool(schoolId) {
      alert("This feature not available until YOUR version of schools.")
    },
	
	test(){
		console.log("hello")
	},
	
	fetchSchools() {
      axios
      .get(this.serviceURL+"/projects")
      .then(response => {
          this.projectsData = response.data.projects;
      })
      .catch(e => {
        alert("Unable to load the school data");
        console.log(e);
      });
    },
  }
  //------- END methods --------

});
