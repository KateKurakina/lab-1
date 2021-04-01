const Request = {
    getStudents() {
        return fetch("/student/all").then(res => res.json);
    }
};
export default Request