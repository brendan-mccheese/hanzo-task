import * as React from "react";
import { useState, useEffect } from "react";
import { ApiResults } from "./ApiResults";
import axios from "axios";

interface State {
    helloMessage?: string;
    postgresStr?: string;
    redisConn?: any;
    loading: boolean;
}

export const App = ({apiUrl}) => {
    const [state, setState] = useState<State>({
        helloMessage: '',
        postgresStr: '',
        redisConn: null,
        loading: true,
    } as State)

    useEffect(() => {
        setTimeout(async () => {
            let data = {};
            try {
                const message = await axios(`${apiUrl}`);
                if(message.data) {
                    data = {
                        ...data,
                        helloMessage: message.data
                    }
                }
            }
            catch(err) {
                console.error(err);
            }
            finally {
                setState({ ...data, loading: false });
            }
        }, 5000);
    })

    return (
        <div>
            <h1>Hello Hanzo</h1>
            {
                state.loading ?
                    <div>Loading....</div> :
                    <ApiResults helloMessage={state.helloMessage} postgresConn={state.postgresStr} redisConn={state.redisConn} />
            }
        </div>
    );
};