var hide= true;

	function toggleRows(tableId, rowNumber){

		tbl = document.getElementById(tableId);

		var len = tbl.rows.length;

		var vStyle = (hide)? "none":"";

		tbl.rows[rowNumber].style.display = vStyle;
		
		hide= !hide;
	}

	function clickRow(tabId, tableId){
		if (parent.frames[0].document.getElementById('tb1') != null)
		{
			// Set the value from Hidden Input Box inside Menu. Applicable when in Search, Add
			parent.frames[0].document.getElementById('tb1').value = tabId;
		}
		else if (parent.parent.frames[0].document.getElementById('tb1') != null)
		{
			// Applicable when in Form
			parent.parent.frames[0].document.getElementById('tb1').value = tabId;
		}
	
		if (document.getElementById(tableId) != null)
		{
			tbl = document.getElementById(tableId);
			tbl.style.width = "100%";
						
			for(i = 1; i < tbl.rows.length; i++)
			{
				tbl.rows[i].style.display = "none";
				
				tab = document.getElementById('tab'+i);
				tab.style.color = '#000000';
				tab.style.backgroundColor = '#EEEEEE';

				if (i == tabId) // Selected
				{
					tbl.rows[tabId].style.display = "";
			
					tab = document.getElementById('tab'+tabId);
					tab.style.color = '#000000';
					tab.style.backgroundColor = '#FFFF00';
				} 
			}
			
		}
	}
	
	function displayRow(tableId){
		if (parent.frames[0].document.getElementById('tb1') != null)
		{
			// Get the value from Hidden Input Box inside Menu. Applicable when in Search, Add
			tabId = parent.frames[0].document.getElementById('tb1').value;
		}
		else if (parent.parent.frames[0].document.getElementById('tb1') != null)
		{
			// Applicable when in Form
			tabId = parent.parent.frames[0].document.getElementById('tb1').value;
		}
		else
		{
			tabId = 1; // Default to 1
		}
		
		if (document.getElementById(tableId) != null)
		{
			tbl = document.getElementById(tableId);
			
			for(i = 1; i < tbl.rows.length; i++){
				tbl.rows[i].style.display = "none";
				
				tab = document.getElementById('tab'+i);
				tab.style.color = '#000000';
				tab.style.backgroundColor = '#EEEEEE';

				if (i == tabId) // Selected
				{
					tbl.rows[tabId].style.display = "";
			
					tab = document.getElementById('tab'+tabId);
					tab.style.color = '#000000';
					tab.style.backgroundColor = '#FFFF00';
				} 
			}
			
		}
	}
	


	