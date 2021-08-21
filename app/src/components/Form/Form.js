import React, { useState, useEffect } from "react";

const initialCompetency = [];

const initialSkill = [
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
  {
    ClusterFamily: "",
    SpecialistCluster: "",
    SpecialistTask: "",
  },
];

const initialState = {
  showForm: "",
  skills: [],
  competencies: [],
  occupations: [],
  occupationCompetency: [],

  skillClusterFamily: [],
  skillSpecialistCluster: [],
  skillSpecialistTask: [],

  income2019: [],

  occupation: 0,
  occupationResults: [],

  skill: initialSkill,
  competency: initialCompetency,
};

function Form(props) {
  const [state, setstate] = useState(initialState);

  const getIncome = () => {
    fetch("/data/income2019.json", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    })
      .then(function (resp) {
        return resp.json();
      })
      .then(function (rawdata) {
        const myJson = rawdata;

        setstate((previousState) => {
          return {
            ...previousState,
            income2019: myJson,
          };
        });
      });
  };

  useEffect(() => {
    getIncome();
  }, []);

  const getSkills = () => {
    fetch("/data/skills.json", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    })
      .then(function (resp) {
        return resp.json();
      })
      .then(function (rawdata) {
        const myJson = rawdata;

        let uniqueClusterFamily = [{ ClusterFamily: "" }];
        let uniqueSpecialistCluster = [
          {
            ClusterFamily: "",
            SpecialistCluster: "",
          },
        ];
        let uniqueSpecialistTask = [
          {
            SpecialistCluster: "",
            SpecialistTask: "",
          },
        ];
        rawdata.forEach((s) => {
          if (
            uniqueClusterFamily.filter(
              (e) => e.ClusterFamily === s.ClusterFamily
            ).length === 0
          ) {
            uniqueClusterFamily.push({ ClusterFamily: s.ClusterFamily });
          }

          if (
            uniqueSpecialistCluster.filter(
              (e) =>
                e.ClusterFamily === s.ClusterFamily &&
                e.SpecialistCluster === s.SpecialistCluster
            ).length === 0
          ) {
            uniqueSpecialistCluster.push({
              ClusterFamily: s.ClusterFamily,
              SpecialistCluster: s.SpecialistCluster,
            });
          }

          if (
            uniqueSpecialistTask.filter(
              (e) =>
                e.SpecialistCluster === s.SpecialistCluster &&
                e.SpecialistTask === s.SpecialistTask
            ).length === 0
          ) {
            uniqueSpecialistTask.push({
              SpecialistCluster: s.SpecialistCluster,
              SpecialistTask: s.SpecialistTask,
            });
          }
        });

        setstate((previousState) => {
          return {
            ...previousState,
            skills: myJson,
            skillClusterFamily: uniqueClusterFamily,
            skillSpecialistCluster: uniqueSpecialistCluster,
            skillSpecialistTask: uniqueSpecialistTask,
          };
        });
      });
  };

  useEffect(() => {
    getSkills();
  }, []);

  const getCompetencies = () => {
    fetch("/data/sub-competencies.json", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    })
      .then(function (resp) {
        return resp.json();
      })
      .then(function (rawdata) {
        const myJson = rawdata;

        let uniqueCoreCompetencies = [];

        rawdata.forEach((c) => {
          if (
            uniqueCoreCompetencies.filter(
              (e) => e.CoreCompetencies === c.CoreCompetencies
            ).length === 0
          ) {
            uniqueCoreCompetencies.push({
              CoreCompetencies: c.CoreCompetencies,
              Score: 1,
            });
          }
        });

        setstate((previousState) => {
          return {
            ...previousState,
            competencies: myJson,
            competency: uniqueCoreCompetencies,
          };
        });
      });

    fetch("/data/occupation-competencies.json", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    })
      .then(function (resp) {
        return resp.json();
      })
      .then(function (rawdata) {
        const myJson = rawdata;
        setstate((previousState) => {
          return {
            ...previousState,
            occupationCompetency: myJson,
          };
        });
      });
  };

  useEffect(() => {
    getCompetencies();
  }, []);

  const getOccupations = () => {
    fetch("/data/occupations.json", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    })
      .then(function (resp) {
        return resp.json();
      })
      .then(function (rawdata) {
        const myJson = rawdata;
        setstate((previousState) => {
          return {
            ...previousState,
            occupations: myJson,
          };
        });
      });
  };

  useEffect(() => {
    getOccupations();
  }, []);

  const onChangeSearchByValue = (e) => {
    let { value } = e.target;
    let showForm = state.showForm;
    showForm = value;
    let newSkill = state.skill;
    newSkill.forEach((s) => {
      s.ClusterFamily = "";
      s.SpecialistCluster = "";
      s.SpecialistTask = "";
    });
    let newcompetency = state.competency;
    newcompetency.forEach((s) => {
      s.Score = 0;
    });

    setstate((previousState) => {
      return {
        ...previousState,
        showForm: showForm,
        occupationResults: [],
        occupation: 0,
        skill: newSkill,
        competency: newcompetency,
      };
    });
  };

  const onChangeSkillValue = (e, index) => {
    let { value, name } = e.target;

    let newSkill = state.skill;

    if (newSkill[index][name] !== state.skill && name === "ClusterFamily") {
      newSkill[index][name] = value;
      newSkill[index]["SpecialistCluster"] = "";
      newSkill[index]["SpecialistTask"] = "";
    } else if (
      newSkill[index][name] !== state.skill &&
      name === "SpecialistCluster"
    ) {
      newSkill[index][name] = value;
      newSkill[index]["SpecialistTask"] = "";
    } else {
      newSkill[index][name] = value;
    }

    setstate((previousState) => {
      return {
        ...previousState,
        skill: newSkill,
      };
    });

    //This next bit is significantly repeated and should be in a function.

    //get the list of skills
    let mySkills = state.skill;

    //identify matching occupations
    let results = [];
    let newOccupationResults = [];
    state.skills.forEach((s) => {
      let evaluated = {};
      evaluated.ANZSCOCode = s.ANZSCOCode;
      if (
        mySkills.filter((skill) => skill.SpecialistTask === s.SpecialistTask)
          .length > 0
      ) {
        evaluated.Score = 10;
      } else if (
        mySkills.filter(
          (skill) => skill.SpecialistCluster === s.SpecialistCluster
        ).length > 0
      ) {
        evaluated.Score = 5;
      } else if (
        mySkills.filter((skill) => skill.ClusterFamily === s.ClusterFamily)
          .length > 0
      ) {
        evaluated.Score = 1;
      } else {
        evaluated.Score = 0;
      }

      if (evaluated.Score > 0) {
        evaluated.Income = 0;
        let tmpIncome = state.income2019.filter(
          (o) => parseInt(o.ANZSCOCode) === evaluated.ANZSCOCode
        )[0];
        if (tmpIncome === undefined) {
          tmpIncome = state.income2019.filter(
            (o) =>
              parseInt(o.ANZSCOCode) === Math.floor(evaluated.ANZSCOCode / 10)
          )[0];
        } else {
          evaluated.Income = tmpIncome.AvgIncome2019;
        }
        if (tmpIncome === undefined) {
          tmpIncome = state.income2019.filter(
            (o) =>
              parseInt(o.ANZSCOCode) === Math.floor(evaluated.ANZSCOCode / 100)
          )[0];
        } else {
          evaluated.Income = tmpIncome.AvgIncome2019;
        }
        if (tmpIncome === undefined) {
          tmpIncome = state.income2019.filter(
            (o) =>
              parseInt(o.ANZSCOCode) === Math.floor(evaluated.ANZSCOCode / 1000)
          )[0];
        } else {
          evaluated.Income = tmpIncome.AvgIncome2019;
        }

        evaluated.ANZSCOTitle = state.occupations.filter(
          (o) => o.ANZSCOCode === evaluated.ANZSCOCode
        )[0].ANZSCOTitle;

        let index = results
          .map(function (e) {
            return e.ANZSCOCode;
          })
          .indexOf(evaluated.ANZSCOCode);

        if (index >= 0) {
          results[index].Score += evaluated.Score;
        } else {
          results.push(evaluated);
        }
      }
    });

    results.sort(function (a, b) {
      return b.Score - a.Score;
    });

    newOccupationResults = results.slice(0, 25);

    setstate((previousState) => {
      return {
        ...previousState,
        occupationResults: newOccupationResults,
      };
    });
  };

  const onChangeCoreCompetenciesValue = (e, index) => {
    let { value } = e.target;
    let myCompetency = state.competency;
    myCompetency[index].Score = value;

    setstate((previousState) => {
      return {
        ...previousState,
        competency: myCompetency,
      };
    });

    // //get the list of skills
    // let mySkills = state.skill;

    // identify matching occupations
    let results = [];
    let newOccupationResults = [];
    state.occupationCompetency.forEach((req) => {
      let evaluated = {};
      evaluated = {
        ANZSCOCode: req.ANZSCOCode,
        Score: 0,
      };
      let curCompetency = myCompetency.filter(
        (c) => req.CoreCompetencies === c.CoreCompetencies
      )[0];

      if (parseInt(curCompetency.Score) < parseInt(req.Score))
        evaluated.Score = 0;
      else if (parseInt(curCompetency.Score) === parseInt(req.Score))
        evaluated.Score = 50;
      else if (parseInt(curCompetency.Score) < parseInt(req.Score) + 1)
        evaluated.Score = 100;
      else evaluated.Score = 10; // occupations you're overqualified for. You'll get bored.

      evaluated.Income = 0;
      let tmpIncome = state.income2019.filter(
        (o) => parseInt(o.ANZSCOCode) === evaluated.ANZSCOCode
      )[0];
      if (tmpIncome === undefined) {
        tmpIncome = state.income2019.filter(
          (o) =>
            parseInt(o.ANZSCOCode) === Math.floor(evaluated.ANZSCOCode / 10)
        )[0];
      } else {
        evaluated.Income = tmpIncome.AvgIncome2019;
      }
      if (tmpIncome === undefined) {
        tmpIncome = state.income2019.filter(
          (o) =>
            parseInt(o.ANZSCOCode) === Math.floor(evaluated.ANZSCOCode / 100)
        )[0];
      } else {
        evaluated.Income = tmpIncome.AvgIncome2019;
      }
      if (tmpIncome === undefined) {
        tmpIncome = state.income2019.filter(
          (o) =>
            parseInt(o.ANZSCOCode) === Math.floor(evaluated.ANZSCOCode / 1000)
        )[0];
      } else {
        evaluated.Income = tmpIncome.AvgIncome2019;
      }

      evaluated.ANZSCOTitle = state.occupations.filter(
        (o) => o.ANZSCOCode === evaluated.ANZSCOCode
      )[0].ANZSCOTitle;
      let index = results
        .map(function (e) {
          return e.ANZSCOCode;
        })
        .indexOf(evaluated.ANZSCOCode);

      if (index >= 0) {
        results[index].Score += evaluated.Score;
      } else {
        results.push(evaluated);
      }
    });

    results.sort(function (a, b) {
      let e = b.Score - a.Score;
      if (e === 0) e = Math.random() * 2 - 1;
      return e;
    });

    newOccupationResults = results.slice(0, 25);

    setstate((previousState) => {
      return {
        ...previousState,
        occupationResults: newOccupationResults,
      };
    });
  };

  const onChangeOccupationValue = (e) => {
    //set the state
    let { value } = e.target;
    setstate((previousState) => {
      return {
        ...previousState,
        occupation: Number(value),
      };
    });

    //get the list of skills
    let mySkills = state.skills.filter(
      (skill) => skill.ANZSCOCode.toString() === value.toString()
    );

    //identify matching occupations
    let results = [];
    let newOccupationResults = [];
    state.skills.forEach((s) => {
      let evaluated = {};
      evaluated.ANZSCOCode = s.ANZSCOCode;
      if (
        mySkills.filter(
          (skill) =>
            skill.SpecialistTask.toString() === s.SpecialistTask.toString()
        ).length > 0
      ) {
        evaluated.Score = 10;
      } else if (
        mySkills.filter(
          (skill) => skill.SpecialistCluster === s.SpecialistCluster
        ).length > 0
      ) {
        evaluated.Score = 5;
      } else if (
        mySkills.filter((skill) => skill.ClusterFamily === s.ClusterFamily)
          .length > 0
      ) {
        evaluated.Score = 1;
      } else {
        evaluated.Score = 0;
      }

      if (evaluated.Score > 0) {
        evaluated.Income = 0;
        let tmpIncome = state.income2019.filter(
          (o) => parseInt(o.ANZSCOCode) === evaluated.ANZSCOCode
        )[0];
        if (tmpIncome === undefined) {
          tmpIncome = state.income2019.filter(
            (o) =>
              parseInt(o.ANZSCOCode) === Math.floor(evaluated.ANZSCOCode / 10)
          )[0];
        } else {
          evaluated.Income = tmpIncome.AvgIncome2019;
        }
        if (tmpIncome === undefined) {
          tmpIncome = state.income2019.filter(
            (o) =>
              parseInt(o.ANZSCOCode) === Math.floor(evaluated.ANZSCOCode / 100)
          )[0];
        } else {
          evaluated.Income = tmpIncome.AvgIncome2019;
        }
        if (tmpIncome === undefined) {
          tmpIncome = state.income2019.filter(
            (o) =>
              parseInt(o.ANZSCOCode) === Math.floor(evaluated.ANZSCOCode / 1000)
          )[0];
        } else {
          evaluated.Income = tmpIncome.AvgIncome2019;
        }

        evaluated.ANZSCOTitle = state.occupations.filter(
          (o) => o.ANZSCOCode === evaluated.ANZSCOCode
        )[0].ANZSCOTitle;
        let index = results
          .map(function (e) {
            return e.ANZSCOCode;
          })
          .indexOf(evaluated.ANZSCOCode);

        if (index >= 0) {
          results[index].Score += evaluated.Score;
        } else {
          results.push(evaluated);
        }
      }

      results.sort(function (a, b) {
        return b.Score - a.Score;
      });

      newOccupationResults = results.slice(0, 25);

      setstate((previousState) => {
        return {
          ...previousState,
          occupationResults: newOccupationResults,
        };
      });
    });
  };

  return (
    <div>
      <h1>Hello!</h1>
      <p>This form will help you find an occupation that best fits you.</p>
      <p>How would you like to search?</p>
      <div onChange={onChangeSearchByValue} defaultValue={state.showForm}>
        <input type="radio" value="skills" name="searchBy" /> skills
        <input type="radio" value="competencies" name="searchBy" /> competencies
        <input type="radio" value="occupation" name="searchBy" /> occupation
      </div>

      {state.showForm && state.showForm === "skills" ? (
        <div className="col">
          Please select your skills:
          <table>
            <thead>
              <tr>
                <th>Category</th>
                <th>Skill Type</th>
                <th>Skill</th>
              </tr>
            </thead>
            <tbody>
              {state.skill.map((skill, index) => (
                <tr key={index}>
                  <td>
                    <select
                      name="ClusterFamily"
                      value={skill.ClusterFamily}
                      className="form-control"
                      onChange={(e) => onChangeSkillValue(e, index)}
                    >
                      {state.skillClusterFamily.map((data) => (
                        <option
                          key={data.ClusterFamily}
                          value={data.ClusterFamily}
                        >
                          {data.ClusterFamily}
                        </option>
                      ))}
                    </select>
                  </td>
                  <td>
                    <select
                      name="SpecialistCluster"
                      value={skill.SpecialistCluster}
                      className="form-control"
                      onChange={(e) => onChangeSkillValue(e, index)}
                    >
                      {state.skillSpecialistCluster
                        .filter(
                          (e) =>
                            e.ClusterFamily === skill.ClusterFamily ||
                            e.ClusterFamily === ""
                        )
                        .map((data) => (
                          <option
                            key={data.SpecialistCluster}
                            value={data.SpecialistCluster}
                          >
                            {data.SpecialistCluster}
                          </option>
                        ))}
                    </select>
                  </td>

                  <td>
                    <select
                      name="SpecialistTask"
                      value={skill.SpecialistTask}
                      className="form-control"
                      onChange={(e) => onChangeSkillValue(e, index)}
                    >
                      {state.skillSpecialistTask
                        .filter(
                          (e) =>
                            e.SpecialistCluster === skill.SpecialistCluster ||
                            e.SpecialistCluster === ""
                        )
                        .map((data) => (
                          <option
                            key={data.SpecialistTask}
                            value={data.SpecialistTask}
                          >
                            {data.SpecialistTask}
                          </option>
                        ))}
                    </select>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : null}
      {state.showForm && state.showForm === "competencies" ? (
        <div className="col">
          Please evaluate your competencies:
          <table>
            <thead>
              <tr>
                <th>Competency</th>
                <th>Evaluation</th>
              </tr>
            </thead>
            <tbody>
              {state.competency.map((competency, index) => (
                <tr key={index}>
                  <td>{competency.CoreCompetencies}</td>
                  <td>
                    <select
                      name={competency.CoreCompetencies}
                      value={competency.Score}
                      className="form-control"
                      onChange={(e) => onChangeCoreCompetenciesValue(e, index)}
                    >
                      {state.competencies
                        .filter(
                          (e) =>
                            e.CoreCompetencies === competency.CoreCompetencies
                        )
                        .map((data) => (
                          <option key={data.Score} value={data.Score}>
                            {data.AnchorValue}
                          </option>
                        ))}
                    </select>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : null}
      {state.showForm && state.showForm === "occupation" ? (
        <div className="col">
          Please select your occupation:
          <select
            name="occupation"
            value={state.occupation}
            className="form-control"
            onChange={(e) => onChangeOccupationValue(e)}
          >
            {state.occupations.map((data) => (
              <option key={data.ANZSCOCode} value={data.ANZSCOCode}>
                {data.ANZSCOTitle}
              </option>
            ))}
          </select>
        </div>
      ) : null}
      {state.showForm &&
      state.showForm === "occupation" &&
      state.occupation > 0 ? (
        <div>
          <div>Skills that align with your selected occupation are:</div>
          <table>
            <thead>
              <tr>
                <th>Category</th>
                <th>Skill Type</th>
                <th>Skill</th>
              </tr>
            </thead>
            <tbody>
              {state.skills
                .filter(
                  (skill) =>
                    skill.ANZSCOCode.toString() === state.occupation.toString()
                )
                .map((data, index) => (
                  <tr key={index}>
                    <td>{data.ClusterFamily}</td>
                    <td>{data.SpecialistCluster}</td>
                    <td>{data.SpecialistTask}</td>
                  </tr>
                ))}
            </tbody>
          </table>
        </div>
      ) : null}

      {state.occupationResults && state.occupationResults.length > 0 ? (
        <div>
          <div>Occupations that align with your skills are:</div>
          <table>
            <thead>
              <tr>
                <th>Occupation</th>
                <th>Score</th>
                <th>Average Income for Industry</th>
              </tr>
            </thead>
            <tbody>
              {state.occupationResults.map((data, index) => (
                <tr key={index}>
                  <td>{data.ANZSCOTitle}</td>
                  <td>{data.Score}</td>
                  <td>{data.Income}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : null}
    </div>
  );
}

export default Form;
