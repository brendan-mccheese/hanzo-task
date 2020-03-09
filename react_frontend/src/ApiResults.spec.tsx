import React from "react";
import renderer from 'react-test-renderer';
import { ApiResults } from "./ApiResults";

describe("ApiResult", () => {
    test("renders", () => {
        const component = renderer.create(<ApiResults />)
        expect(component).toMatchSnapshot();
    });
});