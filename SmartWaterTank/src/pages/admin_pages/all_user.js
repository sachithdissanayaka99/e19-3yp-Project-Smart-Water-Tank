import React, { useEffect } from 'react'
import Layout from '../../components/layout'
import axios from 'axios'
import { useDispatch } from 'react-redux'
import { showLoading , hideLoading  } from '../../redux/alertsSlice'
import { useState } from 'react'
import { Table } from 'antd'



export default function AllUser() {

    const [users, setUsers] = useState([])
    const dispatch = useDispatch()

    const getUsersData = async () => {
        try {
            dispatch(showLoading())
            const response = await axios.get('/api/admin/get-all-users',
            {
                headers: { 
                    Authorization: `Bearer ${localStorage.getItem("token")}`,
                  },
            })
            dispatch(hideLoading())
            if (response.data.success) {
                setUsers(response.data.data);   
            }

            console.log(users)
        } catch (error) {
            dispatch(hideLoading())
            console.log(error)
        }
    }

    useEffect(() => {
        getUsersData()
    }
    , [])

    const columns = [

        {
            title : 'FullName',
            dataIndex : 'fullName',
        },

        {
            title : 'Email',
            dataIndex : 'email',
        },

        {
            title : 'Created At',
            dataIndex : 'createdAt',
        },

        {
            title : 'Action',
            dataIndex : 'action',
            render : (text, record) => (
                <div className='d-flex'>
                    <h1 className='anchors'>Block</h1>
                </div>
            )

        },

    ]
  return (
    <Layout>
        <h1 className='page-title'>All User</h1>

        <Table columns={columns} dataSource={users} />
    </Layout>
  )
}
