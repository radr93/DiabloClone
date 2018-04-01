/// @description No longer clicking/dragging

// Well you're not clicking something if you've released the mouse button, right?
global.clickingSomething = false;

// Well you're no longer dragging something if you've released the mouse button, right?
if (instance_exists(obj_DraggableParent)){
	obj_DraggableParent.draggingWindow = false;
}