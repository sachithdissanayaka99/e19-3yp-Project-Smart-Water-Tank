function RegisterValidation(values){

    let errors = {}

    if(!values.fullName.toString()){
        errors.fullName = "Full Name is required"
    }else{
        errors.fullName = ""
    }

    if(!values.email.toString()){
        errors.email = "Email is required"
    }else if(!/\S+@\S+\.\S+/.test(values.email)){
        errors.email = "Email is invalid"
    }else{
        errors.email = ""
    }

    if(!values.password.toString()){
        errors.password = "Password is required"
    }else if(values.password.toString().length < 6){
        errors.password = "Password must be more than six characters"
    }else{
        errors.password = ""
    }

    if(!values.confirmPassword.toString()){
        errors.confirmPassword = "Password is required"
    }else if(values.confirmPassword.toString() !== values.password.toString()){
        errors.confirmPassword = "Password do not match"
    }
    else{
        errors.confirmPassword = ""
    }

    return errors;

}

export default RegisterValidation;