RegisterCommand("camera", function()
	cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	SetCamCoord(cam, -2224.62, 1905.29, 424.75, 230.79)
	SetCamRot(cam, 0, 0, 0, 2)
	SetCamActive(cam, true)
	RenderScriptCams(true, true, 1000, true, false)

	Wait(3000)

	RenderScriptCams(false, true, 1000, true, false)
	DestroyCam(cam, true)
end)