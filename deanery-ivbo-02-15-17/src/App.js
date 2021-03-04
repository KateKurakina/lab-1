import logo from './logo.svg';
import './App.css';
import "bootstrap/dist/css/bootstrap.css";
import { Navbar, Nav, Dropdown, Tabs, Table, Tab } from "react-bootstrap";
import {Component} from "react";
import Request from "./Services/Request"



class App extends Component {
  constructor() {
    super();
    this.state = {
      activeGroup: 0,
      students: null
    };
  }

  componentDidMount() {
    Request.getStudents().then((students) => {
      this.setState({students: students});
    });
  }

  render() {
    return (
        <div className="App">
          {this.state.students ? <JournalTable
              students={this.state.students[this.state.activeGroup]}/> : null}
          <button onClick={() => {
            this.setState({activeGroup: 0});
          }}>Группа 1</button>
          <button onClick={() => {
            this.setState({activeGroup: 1});
          }}>Группа 2</button>
          <button onClick={() => {
            this.setState({activeGroup: 2});
          }}>Группа 3</button>
        </div>
    );
  }
}

class JournalTable extends Component {
  render()
  {
    return <Table bordered>
      <thead>
      <tr>
        <th>#</th>
        <th>ФИО</th>
        <th>ПрИС</th>
        <th>СИИ</th>
      </tr>
      </thead>
      <tbody>
      {this.props.students.map((student, index) => {
        return <tr>
          <td>{index + 1}</td>
          <td>{student.name}</td>
          <td>{student.markPrIS}</td>
          <td>{student.markSII}</td>
        </tr>
      })}
      </tbody>
    </Table>
  }
}

export default App;
