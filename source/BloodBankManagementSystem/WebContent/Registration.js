$(document).ready(function () {
            $.validator.addMethod("alphaonly", function (value, element) {
                return  /^([a-zA-Z]{1,50})$/.test(nm);
                });

            $.validator.addMethod("special", function (value, element) {
                return /[^a-zA-Z0-9]/.test(value);
            });
            $("form[name='registration']").validate({
                rules: {
                    nm: 
                        {
                            required: true,
                            alphaonly: true
                        },
                   
                    email: 
                        {
                            required: true,
                            email: true
                        },
                    pwd:
                        {
                            required: true,
                            minlength: 10,
                            special: true
                        }
                },
                messages: {
                    nm:
                        {
                            required: "Name is required",
                            alphaonly: "only alphabets,spaces and max length should be 50 characters!"
                        },
                   
                    email: 
                        {
                            required: "Email required",
                            email: "your email is not valid"
                        },
                    pwd: 
                        {
                            required: "Password is required",
                            minlength: "min length is 10",
                            special: "one special character required"
                        }
                },
                submitHandler: function (form) {
                    alert("form is getting submitted");
                    form.submit();
                }
                
            });
        });