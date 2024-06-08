local StarterGui = game:GetService("StarterGui")

local Notifications = {
	"Aimbot killed!",
}

local TimeBetweenNotifications = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999 --REPLACE 5 WITH THE NUMBER OF SECONDS YOU WANT TO WAIT IN BETWEEN NOTIFICATIONS APPEARING

while true do
	for i = 1, #Notifications do
		local Notification = Notifications[i]
		
		StarterGui:SetCore("SendNotification", {
			Title = "System Notification",
			Text = Notification,
			Duration = 5
		})
		
		wait(TimeBetweenNotifications)
	end
end
