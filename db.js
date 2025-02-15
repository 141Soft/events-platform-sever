import mysql2 from 'mysql2/promise';
import fs from 'fs/promises';
import { parseSQL } from './utils/parsers.js';
import 'dotenv/config'

const MYSQL_CONF = {
    connectionLimit: 10,
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    port: process.env.MYSQL_PORT,
};

class DBHelper {

    constructor() {
        this.pool = null;
        return this;
    }

    async openPool(config) {
        return this.pool = mysql2.createPool(config);
    }

    async closePool() {
        if(this.pool){
            await this.pool.end();
            this.pool = null;
        }
    }

    //Allows multiple operations to be carried out on the same connection before releasing
    async reserveConnection(callback) {

        let connection = null;

        try{
            connection = await this.pool.getConnection();
            return await callback(connection);
        } catch(error) {
            throw error;
        } finally {
            connection.release();
        }
    }

    async schema(schemaPath) {
        if(this.pool === null){
            console.error('Connection pool not initialized.');
            return false
        };
        if(!schemaPath){
            console.error('Missing required path: Schema.');
            return false
        };

        let connection = null;

        try{
            connection = await this.pool.getConnection();
            const queries = parseSQL(await fs.readFile(schemaPath));

            console.log(`Implementing database Schema with ${queries.length} queries`)
            for(const query of queries){
                const result = await this.pool.query(query);
                console.log(result);
            }
            console.log('Schema complete.');
            return true;
        } catch (error) {
            throw error;
        } finally {
            connection.release();
        }
    }

    async seed(schemaPath, seedPath, logging) {
        if(this.pool === null){
            console.error('Connection pool not initialized.');
            return false
        };
        if(!schemaPath || !seedPath){
            console.error('Missing required paths: Schema and Seed.');
            return false
        };

        let connection = null;
        try{
            connection = await this.pool.getConnection();

            const [schemaFile, seedFile] = await Promise.all([
                fs.readFile(schemaPath),
                fs.readFile(seedPath)
            ]);
            const queries = [...parseSQL(schemaFile), ...parseSQL(seedFile)];

            if(logging){
                console.log(`Seeding database with ${queries.length} queries...`);
            };
            
            for(const query of queries){
                const result = await connection.query(query);
                if(logging){
                    console.log(result);
                };
            }
            if(logging){
                console.log('Seeding complete!');
            }
            return true;
        } catch(error) {
            console.error(error);
            throw error;
        } finally {
            connection.release();
        }
    }
}

export const db = new DBHelper;
db.openPool(MYSQL_CONF);