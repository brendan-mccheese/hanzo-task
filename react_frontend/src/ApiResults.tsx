import * as React from "react";

interface ApiResultsProps {
    readonly helloMessage?: string;
    readonly postgresConn?: string;
    readonly redisConn?: any;
}
export const ApiResults = ({helloMessage, postgresConn, redisConn}: ApiResultsProps) => (
    <div>
        <h2 data-e2e-id="api-title">API Results</h2>
        <ul>
            <li>
                <span>Hello Message: </span>
                <span>{helloMessage ?? "No message received"}</span>
            </li>
        </ul>
    </div>
)