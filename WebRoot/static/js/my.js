
$(document).ready(function() {
	var menuParent = $('.menu > .ListTitlePanel > div');//��ȡmenu�µĸ����DIV
	var menuList = $('.menuList');
	
	//����ÿ���б�Ĵ����Ϊ�����õ���¼�
	$('.menu > .menuParent > .ListTitlePanel > .ListTitle').each(function(i) {//��ȡ�б�Ĵ���Ⲣ����
		$(this).click(function(){
			//�����������б�Ĳ˵��б�û����ʾ���򽫲˵��б�������������
			if($(menuList[i]).css('display') == 'none'){
				//���˵��б���
				$(menuList[i]).slideDown(300);
			}
			else{
				//���˵��б�����
				$(menuList[i]).slideUp(300);
			}
		});
	});
});