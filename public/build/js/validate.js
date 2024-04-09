 // đối tượng validate
 validator= (options)=>{
    // Array lưu các rule selector
    var SelectorRules ={};
    // function get parent
    function getParent(element,selector){
       while (element.parentElement) {
           if (element.parentElement.matches(selector)) {
               return element.parentElement;
           }
           element = element.parentElement;
       }
    }
    // function validate
    function validate(inputElement,rule){
       var Message = getParent(inputElement,options.formGroup).querySelector(options.error);
       // var errorMessage  = rule.test(inputElement.value);
       var errorMessage;
      
       // lấy ra các rule của selector
       var rules = SelectorRules[rule.selector];
       // lặp qua từng rule và kiểm tra
       // nếu có lỗi thì dừng việc kiếm tra
       for (var index = 0; index < rules.length; index++) {
           switch (inputElement.type) {
               case 'checkbox':
               case 'radio':
                   errorMessage = rules[index](ElementForm.querySelector(rule.selector + ':checked'));
                   break;
               default:
                   errorMessage = rules[index](inputElement.value);
           }
         
           if(errorMessage) break;
       }
       //  kiểm tra có lỗi thì đưa ra màn hình hk thì không hiển thị lỗi
       if (errorMessage) {
           Message.innerText = errorMessage;
           Message.style.color = "red";
       }
       else{
           Message.innerText = "";
       }
       return !errorMessage;
    }
 
   // Lấy Element From cần validate
   ElementForm = document.querySelector(options.form);
   // kiểm tra lấy được form element
   // lấy các rule 
               //  console.log(options.rules)
   if(ElementForm){
       ElementForm.onsubmit = (e)=>{
           e.preventDefault();
           var FormValid = true;
           options.rules.forEach(function(rule){
           var inputElement = ElementForm.querySelector(rule.selector);
               var isValid = validate(inputElement,rule);
               if (!isValid) {
                   FormValid = false;  
               }
       });
       // kiểm tra có lỗi hay không
       if (FormValid) {
           // submit theo javascript
           if (typeof options.onsubmit ==="function") {
              var enableInput  = ElementForm.querySelectorAll('[name]');
              var formValues = Array.from(enableInput).reduce(function(values,input){
                  switch (input.type) {
                      case 'radio':
                          values[input.name] = ElementForm.querySelector('input[name="'+input.name+'"]:checked').value
                          break;
                       case 'checkbox':
                       if (!input.matches(':checked')) {
                           values[input.name] = [];
                       }
                       if (!Array.isArray(values[input.name])) {
                           values[input.name] = [];
                       }
                       values[input.name].push(input.value); 
                       break;
                       case 'file':
                           values[input.name] = input.files;
                       break;
                      default:
                       values[input.name] = input.value;
                  }
                  return values;
              },{});
              options.onsubmit(formValues);
          }
          else{
              // submit mặc định
           ElementForm.submit(); 
          }
       }
       else{
           
       }

       }
       // xử lý lặp qua mỗi rule
       options.rules.forEach(function(rule){
           // Lưu lại các rule cho mỗi input
           if (Array.isArray(SelectorRules[rule.selector])) {
               SelectorRules[rule.selector].push(rule.test); 
           }
           else{
               SelectorRules[rule.selector] = [rule.test];
           }
           // tìm input trong form
           var inputElement = ElementForm.querySelectorAll(rule.selector);
           // lặp input Element
           Array.from(inputElement).forEach(function(inputElement){
               var Message = getParent(inputElement,options.formGroup).querySelector(options.error);
               // inputElement.onblur = ()=>{
               //     // lấy value input truyền vào rule qua inputElement.value
               //     // test func qua rule.test
               //                 // var errorMessage  = rule.test(inputElement.value);
               //                 //   var Message = inputElement.parentElement.querySelector(options.error);
               //     // truyền đối số lên function validate
               //     validate(inputElement,rule);
               // }
                // xử lý mỗi khi người dùng nhập vào input
                inputElement.oninput = ()=>{
                   Message.innerText = "";
                }
           });
               
       });
   }
   
}
// Định nghĩa các rule
validator.isRequired = (selector,message)=>{
   return {
       selector,
       test:function(value){
           return value?undefined:message||"Trường này không được để trống!"
       }
   }
}
validator.isEmail = (selector)=>{
   return {
       selector,
       test:function(value){
           var regex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
           return regex.test(value)?undefined:"Trường này đã sai định dạng Email"
       }
   }
}
validator.isMin = (selector,min)=>{
   return {
       selector,
       test:function(value){
           return value.length >= min ? undefined:`Mật khẩu ít nhất ${min} kí tự`;
       }
   }
}
validator.isConfirm = (selector,Confirm,mesage)=>{
   return {
       selector,
       test:function(value){
          return value === Confirm()?undefined:mesage||"Trường này nhập không chính xác"
       }
   }
}
validator.isPhone = (selector)=>{
   return {
       selector,
       test:function(value){
           var regex = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
           return regex.test(value)?undefined:"Không đúng định dạng số điện thoại"
       }
   }
}
function createSlug(slug){
   var slug = slug.value;
   var control = $('#name').attr('data-control');
   if(slug)
   {
       $.ajax
       ({
           method: "POST",
           url: control+"/createSlug",
           data: { slug:slug},
           dataType: "json",
           success: function(data){
               if(data.slug){
                   $('#alias').val(data.slug);
               }
           }
       });
   }
}
function FormatNumber(num)
{
   var pattern = "0123456789.";
   var len = num.value.length;
   if (len != 0)
   {
       var index = 0;

       while ((index < len) && (len != 0))
           if (pattern.indexOf(num.value.charAt(index)) == -1)
           {
               if (index == len-1)
                   num.value = num.value.substring(0, len-1);
               else if (index == 0)
                       num.value = num.value.substring(1, len);
                    else num.value = num.value.substring(0, index)+num.value.substring(index+1, len);
               index = 0;
               len = num.value.length;
           }
           else index++;
   }
   val = num.value;
   val = val.replace(/[^\d.]/g,"");
   arr = val.split('.');
   lftsde = arr[0];
   rghtsde = arr[1];
   result = "";
   lng = lftsde.length;
   j = 0;
   for (i = lng; i > 0; i--){
       j++;
       if (((j % 3) == 1) && (j != 1)){
           result = lftsde.substr(i-1,1) + "," + result;
       }else{
           result = lftsde.substr(i-1,1) + result;
       }
   }
   if(rghtsde==null){
       num.value = result;
   }else{
       num.value = result+'.'+arr[1];
   }
}