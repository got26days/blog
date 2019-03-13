$(document).ready(function() {
  function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
  }
  var random = getRandomInt(0, 100);
  var requested_type = null;

  function reachGoal(action) {
    console.log('Reach Goal: '+action);
    yaCounter50856059.reachGoal('push_'+action);
    //yaCounter50856059.reachGoal('push_'+action+'_'+requested_type);
    gtag('event', action, {
      'event_category': 'push',
      'event_label': requested_type
    });
  }

  function eventSubscribed() {
    reachGoal('subscribed');
  }

  function eventApproved() {
    reachGoal('approved');
  }

  function eventRejected() {
    reachGoal('rejected');
  }

  function eventPermissionRequested() {
    reachGoal('permission_request');
  }

  function requestPushPermission() {
    window.OneSignal.registerForPushNotifications();
      requested_type = 'direct';
    /*if (random>=0 && random<=32) {
      window.OneSignal.registerForPushNotifications();
      requested_type = 'direct';
    } else if (random>=33 && random<=65) {
      requested_type = 'popup';
      OneSignal.push(function(){
        OneSignal.showHttpPrompt();
      });
    } else {
      requested_type = 'bar';
      showRequestPermissionBar();
    }*/
    
  }

  function showRequestPermissionBar() {
    $(".push-bar").show();
    $("body").css("margin-top", $(".push-bar").height()+"px");
    eventPermissionRequested();
  }
  function hideRequestPermissionBar() {
    $("body").css("margin-top", "0px");
    $(".push-bar").hide();
  }

 
    window.OneSignal.push(function(){
      OneSignal.on('popoverShown', function() {
        eventPermissionRequested();
      });

      OneSignal.on('permissionPromptDisplay', function() {
        eventPermissionRequested();
      });

      OneSignal.on('popoverCancelClick', function() {
        eventRejected();
      });

      OneSignal.on('popoverAllowClick', function() {
        eventApproved();
      });

      OneSignal.on('notificationPermissionChange', function(permissionChange) {
        var to = permissionChange.to;
        if (to=='denied' || to=='default') {
          eventRejected();
        } else {
          eventSubscribed();
        }
        $(".push-bar").hide();
      });
      
    if (OneSignal.isPushNotificationsSupported()) {
      getSubscriptionState().then(function(state) {
        if (state.isOptedOut) {
          window.OneSignal.setSubscription(true);
        } else {
          if (!state.isPushEnabled) {
              requestPushPermission();
          } else {
            $(".push-bar").hide();
          }
        }
      });
    }



    function subscribeFromBar() {
      eventApproved('bar');
      window.OneSignal.registerForPushNotifications();
    }

    function getSubscriptionState() {
      return Promise.all([
        window.OneSignal.isPushNotificationsEnabled(),
        window.OneSignal.isOptedOut()
      ]).then(function(result) {
        var isPushEnabled = result[0];
        var isOptedOut = result[1];

        return {
            isPushEnabled: isPushEnabled,
            isOptedOut: isOptedOut
        };
      });
    }
        
    $(".push-subscribe-button").click(function(){
      subscribeFromBar();
    });
  });
});