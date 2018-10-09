var XMLHttpReq;
var upper;
var lower;
var completeDiv;
var inputField;
var completeTable;
var completeBody;

function isValidityYear()
{
	var start = document.getElementById("D_StartTime");
	var end = document.getElementById("D_EndTime");
	var text = document.getElementById("timeText");
	var myDate = new Date();
	if(start.value<myDate.getFullYear())
	{	
		text.innerText = "��ʼ��������ڵ��ڵ�ǰ����!"
		start.foucus();
		end.readOnly = true;
	}
	else
	{
		text.innerText = "";
		end.readOnly = false;
	}
	if(end!="")
	{
		if(end.value<start.value)
		{
			text.innerText = "��ֹ����Ӧ������ʼ���ڣ�"
		}
		else
		{
			text.innerText = ""
		}
	}	
}

function showTextLength(location,text,length)
{
	
	var location = document.getElementById(location);
	var text = document.getElementById(text);
	location.innerText = text.value.length+"/"+length;
}

function getUI()
{
	//alert("aaa");
	var n = document.getElementById("form1").type;
	var S_type;
	for(var i=0;i<n.length;i++)
	{
		if(n.item(i).checked)
		{
			S_type = n.item(i).value;
			break;
		}
		else
		{
			continue;
		}
	}
	
	var servics = document.getElementById("servics");
	var sub = document.getElementById("sub");
	var industry = document.getElementById("industry");
	if(S_type == ("�����о�"))
	{
		servics.style.display="none";
		industry.style.display="none";
		sub.style.display="table-row";
	}
	else
	{
		sub.style.display="none";
		servics.style.display="table-row";
		
		industry.style.display="table-row";
	}
}
//�ؼ�������¼��
function ChangeState()
{
	//alert("�밴˳����д");
	var D_key1 = document.getElementById('key1');
	var D_key2 = document.getElementById('key2');
	var D_key3 = document.getElementById('key3');
	var D_key4 = document.getElementById('key4');
	var D_key5 = document.getElementById('key5');
	
	if(D_key1.value!="")
	{
		D_key2.readOnly = false;
	}
	else
	{
		D_key2.value = "";
		D_key2.readOnly = true;
	}
	
	if(D_key2.value!="")
	{
		D_key3.readOnly = false;
	}
	else
	{
		D_key3.value="";
		D_key3.readOnly = true;
	}
	
	if(D_key3.value!="")
	{
		D_key4.readOnly = false;
	}
	else
	{
		D_key4.value="";
		D_key4.readOnly = true;
	}
	
	if(D_key4.value!="")
	{
		D_key5.readOnly = false;
	}
	else
	{
		D_key5.value="";
		D_key5.readOnly = true;
	}
}

//���غ���ģʽ�����������������
function Close(id)
{
	var widget = document.getElementById(id);
	widget.style.display="none";
}
//չʾ����ģʽ���������������
function Show(id)
{
	var widget = document.getElementById(id);
	widget.style.display="table-row";
}

//����XMLHttpRequest����
function createXMLHttpRequest(){
	if(window.XMLHttpRequest){//Mozilla�����
		XMLHttpReq = new XMLHttpRequest();
	}
	else if(window.ActiveXObject){
		try{
			XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){}
		}
	}
}

//ˢ���б����
function refreshList(upperId,lowerId,tier,action){
	upper = document.getElementById(upperId).value;
	lower = document.getElementById(lowerId);
	if(upper ==""){
		clearList();
		return;
	}
	var url ="CreateDemand?upper="+upper+"&tier="+tier+"&action="+action;
	createXMLHttpRequest();
	XMLHttpReq.open("GET",url,true);
	XMLHttpReq.send(null);//��������
	
	XMLHttpReq.onreadystatechange =processListResponse;//ָ����Ӧ����
	
}

//��������Ϣ
function processListResponse(){
	if(XMLHttpReq.readyState == 4){//�ж϶���״̬
		if(XMLHttpReq.status == 200){//��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
			updateList();
		}else{
			window.alert("���������ҳ�����쳣��");
		}
	}
}

//�����б�����б����
function updateList(){
	clearList();
	//clearList("thirdSubjects");
	
	var results = XMLHttpReq.responseXML.getElementsByTagName("name");
	var values = XMLHttpReq.responseXML.getElementsByTagName("value");
	var option = null;
	
	option = document.createElement("option");
	option.appendChild(document.createTextNode('��ѡ��'));
	option.value="default";
	lower.appendChild(option);
	for(var i=0;i<results.length;i++){
		option = document.createElement("option");
		option.appendChild(document.createTextNode(results[i].firstChild.nodeValue));
		option.value = values[i].firstChild.data;
		lower.appendChild(option);
	}
}
//����б����ԭ��ѡ��ĺ���
function clearList(){
	while(lower.childNodes.length>0){
		lower.removeChild(lower.childNodes[0]);
	}
}

//����ƥ��������
function findName(inputArea,popupArea,messageTable,messageBody){
	inputField = document.getElementById(inputArea);
	completeTable = document.getElementById(popupArea);
	completeBody = document.getElementById(messageTable);
	completeDiv = document.getElementById(messageTable);
	
	if(inputField.value.length>0){
    	createXMLHttpRequest();
	    var url = "CreateDemand?action=match&names="+inputField.value;
	    //����
	    url = encodeURI(url);
	    url = encodeURI(url);
	    XMLHttpReq.open("GET",url,true);
	    XMLHttpReq.send(null);//��������
	    XMLHttpReq.onreadystatechange = processMatchResponse;//��Ӧָ������
	    
	}
    else{
    	clearNames();
    }
}

//��������Ϣƥ�亯��
function processMatchResponse(){
	if(XMLHttpReq.readyState == 4){//�ж϶���״̬
		if(XMLHttpReq.status == 200){//��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
		
			setNames(XMLHttpReq.responseXML.getElementsByTagName("res"));
		}
    	else{
    		window.alert("���������ҳ�����쳣��");
    	}
    }
}

//��������������ƥ����
function setNames(names){
	clearNames();
	var size = names.length;
	setOffsets();
	
	var row,cell,txtNode;
	for(var i=0;i<5;i++)
	{
		var nextNode = names[i].firstChild.data;
		row = document.createElement("tr");
		cell = document.createElement("td");
		
		cell.onmouseout = function(){this.className='mouseOver';};
		cell.onmouseover = function(){this.className='mouseOut';};
		cell.setAttribute("bgcolor","#FFFAFA");
		cell.setAttribute("border","0");
		cell.onclick = function() {completeField(this);};
		
		txtNode = document.createTextNode(nextNode);
		cell.appendChild(txtNode);
		row.appendChild(cell);
		completeBody.appendChild(row);
		
	}
}

//������ʾλ��
function setOffsets(){
	completeDiv.style.width = inputField.offsetWidth+"px";
	var left = calculateOffset(inputField,"offsetLeft");
	var top = calculateOffset(inputField,"offsetTop")+inputField.offsetHeight;
	completeDiv.style.border = "black 1px solid";
	completeDiv.style.left = left +"px";
	completeDiv.style.top = top+"px";
}

//������ʾλ��
function calculateOffset(field,attr){
	var offset = 0;
	while(field){
		offset +=field[attr];
		field = field.offsetParent;
	}
	return offset;
}

//��д�����
function completeField(cell){
	inputField.value = cell.firstChild.nodeValue;
	clearNames();
}

//����Զ������
function clearNames(){
	var ind = completeBody.childNodes.length;
	for(var i = ind - 1;i>=0;i--){
		completeBody.removeChild(completeBody.childNodes[i]);
	}
	completeDiv.style.border = "none";
}
