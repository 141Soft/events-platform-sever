import { fetchUser, insertUser } from "../models/usermodels.js";

export const getUser = async (userParams) => {
    try {
        if(!userParams?.name && !userParams?.email){
            throw new Error("Params Required")
        };

        const result = await fetchUser(userParams);

        // If you get multiple entries in the result array here check the db integrity
        // could be an issue with name/email checking on account creation

        if(!result[0]?.userName || !result[0]?.userEmail){
            throw new Error("No User Found");
        };

        const {userName, userEmail} = result[0];

        return {
            user: {
                userName,
                userEmail
            }
        };
    } catch(err) {
        throw(err)
    }
}

export const postUser = async (userParams) => {
    try{
        //Check user exists
        const userCheck = await fetchUser(userParams);
        //If user exists throw error
        if(userCheck[0]?.userName === userParams.name){
            throw new Error("Username already in use");
        } else if(userCheck[0]?.userEmail === userParams.email){
            throw new Error("Email already in use");
        } else {
            //Else post user
            const result = await insertUser(userParams);
            if(result.status === 'success') {
                return result;
            } else {
                throw new Error("Could not create user");
            }
        }
    } catch(err) {
        throw err;
    }
}