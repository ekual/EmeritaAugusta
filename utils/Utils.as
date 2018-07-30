public function getColladaDisplayObj(tempCO:DisplayObject3D):DisplayObject3D {
	var returnObj:DisplayObject3D;
	
	try {
		var childname:String = String(tempCO.childrenList()).substring(0,String(tempCO.childrenList()).indexOf(": "));
		
		returnObj = tempCO.getChildByName(childname);
		
		trace("found colladaNode: " + childname);
	} catch(errObject:Error) {
		trace(errObject.message);
	}
	
	return returnObj;
}

