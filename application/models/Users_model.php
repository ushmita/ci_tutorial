<?php
/**
 * Created by PhpStorm.
 * User: cham11ng
 * Date: 9/27/16
 * Time: 11:44 PM
 */
class Users_model extends CI_Model {
    public $username;
    public $password;
    public $email;

    public function __construct() {
        parent::__construct();
    }

    public function register_user() {
        $username = $this->input->post('username');
        $password = $this->input->post('password');

        if ($this->db->table_exists('Users')) {
            $this->username = $username;

            $hash = $this->bcrypt->hash_password($password);
            $this->password = $hash;

            $this->email    = $this->input->post('email');
            return $this->db->insert('Users', $this);
        }
        else {
            echo show_error('We have encountered some problem. Visit site later.', 500, 'Opps! Something went wrong');
        }
    }

    public function user_validate () {
        $username = $this->input->post('username');
        $password = $this->input->post('password');

        $query = $this->db->get('Users');
        foreach ($query->result() as $row) {
            if($username == $row->username) {
                if ($this->bcrypt->check_password($password, $row->password)) {
                    $user_session = array(
                        'username'  => $row->username,
                        'id'        => $row->user_id,
                        'logged_in' => TRUE
                    );
                    $this->session->set_userdata('is_logged_in', $user_session);
                    return TRUE;
                }
            }
        }

        return FALSE;
    }
}