import React, { Component } from 'react';

export default class Form extends Component {
    render() {
        return (
            <div className="Form">
                <form>
                    <label>Login:
                        <input type="text" name="username" />
                    </label>
                    <input type="submit" value="Submit" />
                </form>
            </div>
        );
    }

}