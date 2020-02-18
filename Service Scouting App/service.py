import os
import sys
import json
import requests
import csv
from flask import Flask, redirect, url_for, request, send_file
app = Flask(__name__)
@app.route('/matchdata/html', methods=['GET'])
def MatchDataHTMLData():
    data = ''
    with open('matchdata.json','r') as fp:
       data = json.loads(fp.read())
    print 'Match Data ! '
    html_str = '''<!doctype html>
    <html lang="en">
    <head>
      <meta charset="utf-8">

      <title>Match Data</title>
      <meta name="description" content="Match Data">
      <meta name="author" content="Team 2170">
                  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
                  <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
                  <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js"></script>
                  <script src="https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"></script>
                  <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
                  <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.datatables.net/fixedheader/3.1.6/css/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
        <style>
        .center_panel{
            width: 80%;
            margin:0 auto;
        }
        </style>
    </head>
    <body><div class="center_panel"><br>'''
    html_str = html_str + '''<table id="example" class="table table-striped table-bordered nowrap" style="width:100%">
        <thead>
            <tr>'''
    for key in data[0].keys():
        html_str = html_str + '<th>' + key + '</th>'
    html_str = html_str + '</tr>'
    html_str = html_str + '''</thead>'''
    html_str = html_str + '''<tbody>'''
    for team in data:
        html_str = html_str + '<tr>'
        for key in team:
            html_str = html_str + '<td>' + team[key] + '</td>'
        html_str = html_str + '</tr>'
    html_str = html_str + '''</tbody>'''
    html_str = html_str + '''    <tfoot><tr>'''
    for key in data[0].keys():
        html_str = html_str + '<th>' + key + '</th>'
    html_str = html_str + '''</tr>
        </tfoot>
    </table></div>'''
    html_str = html_str + '''
            <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
            <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js"></script>
            <script src="https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"></script>
            <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
            <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

      <script>
      $(document).ready(function() {
    var table = $('#example').DataTable( {
        responsive: true
    } );

    new $.fn.dataTable.FixedHeader( table );
} );
    </script>


        </body>
        </html>'''
    return html_str
@app.route('/matchdata/csv', methods=['GET'])
def MatchCSVData():
    data = ''
    with open('matchdata.json','r') as fp:
       data = json.loads(fp.read())
    data_file = open('matchdatafile.csv', 'w')
    # create the csv writer object
    csv_writer = csv.writer(data_file)
    # Counter variable used for writing
    # headers to the CSV file
    count = 0
    for emp in data:
        if count == 0:
            # Writing headers of CSV file
            header = emp.keys()
            csv_writer.writerow(header)
        count += 1
        # Writing data of CSV file
        csv_writer.writerow(emp.values())
    data_file.close()
    return send_file(os.path.join(os.getcwd() , 'matchdatafile.csv'),attachment_filename='matchdata.csv')
@app.route('/matchdata',methods = ['POST', 'GET'])
def MatchData():
    team_data =[]
    with open('matchdata.json','r') as fp:
        data = fp.read()
        print data
        if data == '':
            team_data = []
        else:
            team_data = json.loads(data)
        print team_data
    if request.method == 'POST':
        rawdata = request.form.to_dict()
        new_team_data = []
        if 'robotNumber' in rawdata.keys():
            if rawdata['robotNumber'] in team_data:
                for team in team_data:
                    if team['robotNumber'] == raw_data['robotNumber']:
                        team = raw_data
                        new_team_data.append(team)
            return json.dumps({'status':'failed'})
        else:
            print 'New Team'
            new_team_data = team_data
            new_team_data.append(rawdata)
        with open('matchdata.json','w') as fp:
            fp.write(json.dumps(new_team_data))
        return json.dumps({'status':'success'})
    return json.dumps(team_data)
@app.route('/pitscouting/html', methods=['GET'])
def PitScoutingHTMLData():
    data = ''
    with open('teamdata.json','r') as fp:
       data = json.loads(fp.read())
    html_str = '''<!doctype html>
    <html lang="en">
    <head>
      <meta charset="utf-8">

      <title>Pit Scouting Data</title>
      <meta name="description" content="Pit Scouting Data">
      <meta name="author" content="Team 2170">
                  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
                  <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
                  <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js"></script>
                  <script src="https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"></script>
                  <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
                  <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.datatables.net/fixedheader/3.1.6/css/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
        <style>
        .center_panel{
            width: 80%;
            margin:0 auto;
        }
        </style>
    </head>
    <body><div class="center_panel"><br>'''
    html_str = html_str + '''<table id="example" class="table table-striped table-bordered nowrap" style="width:100%">
        <thead>
            <tr>'''
    for key in data[0].keys():
        html_str = html_str + '<th>' + key + '</th>'
    html_str = html_str + '</tr>'
    html_str = html_str + '''</thead>'''
    html_str = html_str + '''<tbody>'''
    for team in data:
        html_str = html_str + '<tr>'
        for key in team:
            html_str = html_str + '<td>' + team[key] + '</td>'
        html_str = html_str + '</tr>'
    html_str = html_str + '''</tbody>
        <tfoot><tr>'''
    for key in data[0].keys():
        html_str = html_str + '<th>' + key + '</th>'
    html_str = html_str + '''</tr>
        </tfoot>
    </table></div>'''
    html_str = html_str + '''
                <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
                <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
                <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js"></script>
                <script src="https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"></script>
                <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
                <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

          <script>
          $(document).ready(function() {
        var table = $('#example').DataTable( {
            responsive: true
        } );

        new $.fn.dataTable.FixedHeader( table );
    } );
        </script>
        </body>
        </html>'''
    return html_str
@app.route('/pitscouting/csv', methods=['GET'])
def PitScoutingCSVData():
    data = ''
    with open('teamdata.json','r') as fp:
       data = json.loads(fp.read())
    data_file = open('data_file.csv', 'w')
    # create the csv writer object
    csv_writer = csv.writer(data_file)
    # Counter variable used for writing
    # headers to the CSV file
    count = 0
    for emp in data:
        if count == 0:
            # Writing headers of CSV file
            header = emp.keys()
            csv_writer.writerow(header)
        count += 1
        # Writing data of CSV file
        csv_writer.writerow(emp.values())
    data_file.close()
    return send_file(os.path.join(os.getcwd() , 'data_file.csv'),attachment_filename='pitscouting.csv')
@app.route('/pitscouting',methods = ['POST', 'GET'])
def PitScoutingData():
    team_data =[]
    with open('teamdata.json','r') as fp:
        data = fp.read()
        print data
        if data == '':
            team_data = []
        else:
            team_data = json.loads(data)
        print team_data
    if request.method == 'POST':
        rawdata = request.form.to_dict()
        print rawdata
        new_team_data = []
        if rawdata['robotNumber'] in team_data:
            for team in team_data:
                if team['robotNumber'] == raw_data['robotNumber']:
                    team = raw_data
                    new_team_data.append(team)
        else:
            print 'New Team'
            new_team_data = team_data
            new_team_data.append(rawdata)
        with open('teamdata.json','w') as fp:
            fp.write(json.dumps(new_team_data))
        return json.dumps({'status':'success','data':rawdata})
    return json.dumps(team_data)
if __name__ == '__main__':
   app.run(host="0.0.0.0", port=80)
# command used to get this file in mac terminal from aws server
# sudo scp -P 23 -i /Users/manavmittal/Desktop/ScoutingApp.pem   ubuntu@ec2-52-71-196-37.compute-1.amazonaws.com:~/ScoutingApp/service.py ~/Desktop/service.py

