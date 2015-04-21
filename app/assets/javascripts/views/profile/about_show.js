MovementCentral.Views.AboutShow = Backbone.View.extend({
  template: JST['profile/about'],

  events: {
    'click .edit-nickname': 'renderNicknameForm',
    'click .edit-job-title': 'renderJobTitleForm',
    'click .edit-school': 'renderSchoolForm',
    'click .edit-current-city': 'renderCurrentCityForm',
    'click .edit-hometown': 'renderHometownForm',
    'click .edit-bio': 'renderBioForm',
    'click .cancel': 'cancelEdit',
    'click .save-nickname': 'saveNickname',
    'click .save-job-title': 'saveJobTitle',
    'click .save-school': 'saveSchool',
    'click .save-current-city': 'saveCurrentCity',
    'click .save-hometown': 'saveHometown',
    'click .save-bio': 'saveBio'
  },

  initialize: function (options) {
    this.friendship = options.friendship;
    this.friendships = options.friendships;
  },

  cancelEdit: function (event) {
    this.render();
  },

  render: function () {
    var friendship = this.friendship;
    var show_info;
    if (friendship) {
      show_info = friendship.get('self') || friendship.get('accepted') ||
                  (!friendship.get('stranger') &&
                   !friendship.get('requester'));
    }
    var renderedContent = this.template({
      friendship: friendship,
      show_info: show_info
    });
    this.$el.html(renderedContent);
    return this;
  },

  renderBioForm: function (event) {
    var bio = this.friendship.get('bio');
    if (bio) {
      this.$('.bio').html('<textarea class="form-control">' +
                             this.friendship.get('bio') +
                          '</textarea>' +
                          '<button class="save-bio btn btn-primary btn-xs">Save Changes</button>' +
                          '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    } else {
      this.$('.bio').html('<textarea class="form-control"' +
                                    'placeholder="Enter bio">' +
                          '</textarea>' +
                          '<button class="save-bio btn btn-primary btn-xs">Save Changes</button>' +
                          '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    }
  },

  renderCurrentCityForm: function (event) {
    var current_city = this.friendship.get('current_city');
    if (current_city) {
      this.$('.current-city').html('<input type="text" value="' +
                                this.friendship.get('current_city') +
                               '" class="form-control">' +
                               '<button class="save-current-city btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    } else {
      this.$('.current-city').html('<input type="text" placeholder="' +
                               'Enter current city' +
                               '" class="form-control">' +
                               '<button class="save-current-city btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    }
  },

  renderHometownForm: function (event) {
    var hometown = this.friendship.get('hometown');
    if (hometown) {
      this.$('.hometown').html('<input type="text" value="' +
                                this.friendship.get('hometown') +
                               '" class="form-control">' +
                               '<button class="save-hometown btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    } else {
      this.$('.hometown').html('<input type="text" placeholder="' +
                               'Enter hometown' +
                               '" class="form-control">' +
                               '<button class="save-hometown btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    }
  },

  renderJobTitleForm: function (event) {
    var job_title = this.friendship.get('job_title');
    if (job_title) {
      this.$('.job-title').html('<input type="text" value="' +
                                this.friendship.get('job_title') +
                               '" class="form-control">' +
                               '<button class="save-job-title btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    } else {
      this.$('.job-title').html('<input type="text" placeholder="' +
                               'Enter job title' +
                               '" class="form-control">' +
                               '<button class="save-job-title btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    }
  },

  renderNicknameForm: function (event) {
    var nickname = this.friendship.get('nickname');
    if (nickname) {
      this.$('.nickname').html('<input type="text" value="' +
                                this.friendship.get('nickname') +
                               '" class="form-control">' +
                               '<button class="save-nickname btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    } else {
      this.$('.nickname').html('<input type="text" placeholder="' +
                               'Enter nickname' +
                               '" class="form-control">' +
                               '<button class="save-nickname btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    }
  },

  renderSchoolForm: function (event) {
    var school = this.friendship.get('school');
    if (school) {
      this.$('.school').html('<input type="text" value="' +
                                this.friendship.get('school') +
                               '" class="form-control">' +
                               '<button class="save-school btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    } else {
      this.$('.school').html('<input type="text" placeholder="' +
                               'Enter school' +
                               '" class="form-control">' +
                               '<button class="save-school btn btn-primary btn-xs">Save Changes</button>' +
                               '<button class="cancel btn btn-default btn-xs">Cancel</button>');
    }
  },

  saveBio: function (event) {
    var current_user = new MovementCentral.Models.Friendship();
    var new_bio = this.$('.bio textarea').val();
    var view = this;

    current_user.save({ bio: new_bio }, {
      url: 'api/users/update_attribute',
      success: function () {
        view.friendships.fetch();
      }
    });
  },

  saveCurrentCity: function (event) {
    var current_user = new MovementCentral.Models.Friendship();
    var new_current_city = this.$('.current-city input').val();
    var view = this;

    current_user.save({ current_city: new_current_city }, {
      url: 'api/users/update_attribute',
      success: function () {
        view.friendships.fetch();
      }
    });
  },

  saveHometown: function (event) {
    var current_user = new MovementCentral.Models.Friendship();
    var new_hometown = this.$('.hometown input').val();
    var view = this;

    current_user.save({ hometown: new_hometown }, {
      url: 'api/users/update_attribute',
      success: function () {
        view.friendships.fetch();
      }
    });
  },

  saveJobTitle: function (event) {
    var current_user = new MovementCentral.Models.Friendship();
    var new_job_title = this.$('.job-title input').val();
    var view = this;

    current_user.save({ job_title: new_job_title }, {
      url: 'api/users/update_attribute',
      success: function () {
        view.friendships.fetch();
      }
    });
  },

  saveNickname: function (event) {
    var current_user = new MovementCentral.Models.Friendship();
    var new_nickname = this.$('.nickname input').val();
    var view = this;

    current_user.save({ nickname: new_nickname }, {
      url: 'api/users/update_attribute',
      success: function () {
        view.friendships.fetch();
      }
    });
  },

  saveSchool: function (event) {
    var current_user = new MovementCentral.Models.Friendship();
    var new_school = this.$('.school input').val();
    var view = this;

    current_user.save({ school: new_school }, {
      url: 'api/users/update_attribute',
      success: function () {
        view.friendships.fetch();
      }
    });
  }
});
