// AMT Speedometer v1.0

$(document).ready(function () {
  
    window.addEventListener("message", function (event) { 
        
        let data = event.data;
        let speedUnit = data.speedUnit;

        if (data.showSpeedometer == true) {
            $(".sg-container").fadeIn(2000);
        } else if (data.showSpeedometer == false) {
            $(".sg-container").fadeOut(2000);
        }

        if (data.showGearbox == true) {
            $("#GearIndicator").fadeIn(50);
        } else if (data.showGearbox == false) {
            $("#GearIndicator").fadeOut(50);
        }

        if (data.gear > 0) {
            $("#GearIndicator").text(data.gear);
        } else if (data.gear == 0 && data.speed > 0){
            $("#GearIndicator").text("R ");
        }

        if (data.speed > 0) {
            $("#SpeedIndicator").text(data.speed + " " + speedUnit);
        } else {
            $("#SpeedIndicator").text("0 " + " " + speedUnit);
        }

    })

});