import React, { Component } from 'react';

export default class Form extends Component {
    render() {
        return (
            <SignUpForm
                onSubmit={(e) => console.log('submitted')}
                onChange={(e) => console.log('changed')}
                errors={{ email: 'Invalid' }}
                user={{ email: 'jane@doe.com', name: 'Jane Doe' }}
            />
        );
    }

}