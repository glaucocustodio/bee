import './App.css';
import React from 'react';
import axios from 'axios';

class App extends React.Component {

  constructor(props) {
    super(props);
    this.state = { status: '' };
  }

  handleChange = async (event) => {
    const password = event.target.value

    const response = await axios.post(
      'http://localhost:9292/passwords',
      { password: password },
      { headers: { 'Content-Type': 'application/json' } }
    )
    this.setState({ status: response.data });
  }
  render(){
    return (
      <form>
      <label>
        Password:
        <input type="password" autoFocus={true} name="password" onChange={this.handleChange} />
      </label>
      <input type="submit" value="Submit" />
      {this.state.status}
    </form>
   )
  }
}

export default App;
