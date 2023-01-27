using System;
using GTA;
using GTA.Native;

public class WorkingBlower : Script
{
    public WorkingBlower()
    {
        Tick += OnTick;
    }
    void OnTick(object sender, EventArgs e)
    {
        Ped player = Game.Player.Character;

        if (player.IsInVehicle())
        {
            Vehicle vehicle = player.CurrentVehicle;
            if (vehicle.Model != "rt70") return;
            var door = VehicleDoor.BackRightDoor;
            var accelVal = Game.GetControlNormal(2, Control.VehicleAccelerate);
			float openVal = 0.15f;
			accelVal = accelVal * (1.0f-openVal) + openVal;
            Function.Call(Hash.SET_VEHICLE_DOOR_CONTROL, vehicle, (int)door, 5, accelVal);
     
        }
    }
}
