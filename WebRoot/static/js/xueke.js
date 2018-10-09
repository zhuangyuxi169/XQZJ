
var placesMap={"110000":"��ѧ","110100":"��ѧ","110101":"������ѧ","110102":"������ѧ","110103":"������������ͳ��",
		"110104":"Ӧ����ѧ","110200":"����ѧ","110201":"��������","110202":"����������ԭ�Ӻ�����","110203":"ԭ�����������",
			"120000":"��ѧ","120100":"�������ѧ�뼼��","120101":"��������������","120102":"�����Ӧ�ü���"}
function place(AreaCode,Name){  
    this.AreaCode=AreaCode;//��������  
    this.Name=Name;//����  
    /*�������PlaceType����������ֵ��String���ͣ���ʾ�������"p"����ʡ/ֱϽ�С��ر���������"c"�����У�"d"������/�ء�*/  
    place.prototype.PlaceType=function(){  
        var ac=parseInt(this.AreaCode);  
        if(ac%100!=0){  
            return "d";  
        }else if(ac%10000!=0){  
            return "c";  
        }else{  
            return "p";   
        }  
    }  
    /*���صص�����ʡ����*/  
    place.prototype.ProvinceCode=function(){  
        //����10000�õ�ʡ�����루ǰ2λ���֣�  
        var ac=parseInt(this.AreaCode);  
        return Math.floor(ac/10000);   
    }  
    /*���صص������б���*/  
    place.prototype.CityCode=function(){  
        //����100�õ��м����루ǰ4λ���֣�  
        var ac=parseInt(this.AreaCode);  
        return Math.floor(ac/100);  
    }  
}  
  
var provinces=new Array();//ʡ����  
var cities=new Array();//������  
var districts= new Array();//������  
/*initSeletList()���������ʼ���������������飬����ʡ�����б�*/  
function initSeletList(){  
    //����placesMap���Json����,����key��value�Դ���place���󣬲����ݵ������ͷ���  
    for (var key in placesMap){  
        var pl=new place(key,placesMap[key]);  
        var ty=pl.PlaceType();  
        if(ty=="p"){  
            provinces.push(pl);  
        }  
        if(ty=="c"){  
            cities.push(pl);  
        }  
        if(ty=="d"){  
            districts.push(pl);  
        }  
    }  
    //��ʼ��ʡ����ѡ���б�  
    for(var i=0;i<provinces.length;i++){  
        var op=document.createElement("option");  
        op.text=provinces[i].Name;  
        op.value=provinces[i].ProvinceCode();  
        document.getElementById("firstSubjects").appendChild(op);  
    }     
}  
/*�����б�ѡ��ı�ʱִ�д˺���*/  
function changeSelect(element){  
    var id=element.getAttribute("id");  
    /*ʡ�����б�ı�ʱ�����������б���������б�*/  
    if(id=="firstSubjects"&&element.value!="000000"){  
        document.getElementById("secondSubjects").options.length=1;//����������б��ѡ��  
        var pCode=parseInt(element.value);//��ȡʡ�����б�ѡȡ���ʡ����  
        /*����ʡ��������������б�*/  
        if(pCode!=0){  
            for(var i=0;i<cities.length;i++){  
                if(cities[i].ProvinceCode()==pCode){  
                    var op=document.createElement("option");  
                    op.text=cities[i].Name;  
                    op.value=cities[i].CityCode();  
                    document.getElementById("secondSubjects").appendChild(op);  
                }  
            }  
        }  
        document.getElementById("thirdSubjects").options.length=1;//����������б��ѡ��  
        var cCode=parseInt(document.getElementById("secondSubjects").value);//��ȡ�������б�ѡ������б���  
        /*�����б�������������б�*/  
        if(cCode!=0){  
            for(var i=0;i<districts.length;i++){  
                if(districts[i].CityCode()==cCode){  
                    var op=document.createElement("option");  
                    op.text=districts[i].Name;  
                    op.value=districts[i].AreaCode;  
                    document.getElementById("thirdSubjects").appendChild(op);  
                }     
            }  
        }  
    }  
    /*�������б�ı�ʱ�����������б��ѡ��*/  
    if(id=="secondSubjects"&&element.value!="000000"){  
        document.getElementById("thirdSubjects").options.length=1;//����������б��ѡ��  
        var cCode=parseInt(element.value);//��ȡ�������б�ѡ������б���  
        /*�����б�������������б�*/  
        for(var i=0;i<districts.length;i++){  
            if(districts[i].CityCode()==cCode){  
                var op=document.createElement("option");  
                op.text=districts[i].Name;  
                op.value=districts[i].AreaCode;  
                document.getElementById("thirdSubjects").appendChild(op);  
            }  
        }  

    }  
}  
window.onload=function(){  
    initSeletList();  
}; 
